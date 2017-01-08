rule Heist
{
	meta:
    	md5_1 = "0ebf68bb15c2e36508cf3f46d32cf2e3"
        md5_2 = "c49b7a9681ad387922f14a1601652e5b"
        md5_3 = "e0350e67c526ffab0c97c5e04a6e9f12"
        md5_4 = "bb552a4bdc573566da897a651b9041e6"
        date = "11/4/2015"
        author = "Kevin Perlow"
        reference = "https://www.youtube.com/watch?v=DdkLY99HgAA"

	strings:

        $string = "Coded By - (Picasso)"

    condition:

        any of them

}

rule backoff_opcode
{
	meta:
		author = "Swackhamer"
		md5 = "01F0D20A1A32E535B950428F5B5D6E72"
    reference = "https://www.youtube.com/watch?v=DdkLY99HgAA"
	strings:
	// Function: 404344 cc_validation
		$cc_validation = { 3C 5E ?? ?? ?? 74 ?? 3C 3D 0F ?? ?? ?? ?? ?? ?? ?? ?? 83 ?? ?? 3C 01 ?? ?? ?? 76 ?? 80 ?? ?? ?? 0F ?? ?? ?? ?? ?? 3C 01 ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? 74 ?? 39 ?? ?? ?? ?? ?? 76 ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? 80 ?? ?? 76 ?? ?? ?? 80 ?? ?? 74 ?? 80 ?? ?? 74 ?? 80 ?? ?? ?? 74 ?? E9 ?? ?? ?? ?? ?? ?? EB ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? 3C 04 0F ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? 3C 09 0F ?? ?? ?? ?? ?? 83 ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? 83 ?? ?? 0F ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? 3C 09 0F ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? 3C 09 0F ?? ?? ?? ?? ?? 83 ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? 83 ?? ?? 0F ?? ?? ?? ?? }
	// Function: 404539 memory_enum
		$memory_enum = { 3B ?? ?? ?? ?? ?? 73 ?? ?? ?? ?? C7 ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 ?? ?? ?? ?? 75 ?? ?? ?? ?? E8 ?? ?? ?? ?? 5? ?? ?? E9 ?? ?? ?? ?? 83 ?? ?? ?? 75 ?? ?? ?? 81 ?? ?? ?? ?? ?? ?? 75 ?? 8B ?? ?? 39 C6 73 ?? 29 ?? ?? ?? B8 ?? ?? ?? ?? 81 ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? A1 ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? C7 ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? 8B ?? ?? ?? ?? ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 ?? ?? ?? ?? 75 ?? 8B ?? ?? EB ?? 8B ?? ?? ?? ?? ?? ?? ?? ?? A1 ?? ?? ?? ?? ?? ?? ?? E8 }
	condition:
		any of them

}

rule russian_ransomware_Sept22
{
meta:
	description = "Found on http://abrazivstroy.ru/wp-content/uploads/2015/01/ Tracking full campaign"
	date = "09/22/2015"
	author = "Kevin Perlow"
	note = "The path string will also allow it to pick up the infostealer from the same source. Comment it out if you want"
	note1 = "The smoothtiny string is the best way to catch the fourth piece which didnt contain the unique string"
  reference = "https://www.youtube.com/watch?v=DdkLY99HgAA"
strings:
    $profile1 = "ame View Xerrter Fertui's profile. Viadeo helps professionals like Xerrter Fertui boost their career" wide
	$profile2 = "View Xerrter Fertui's profile. Viadeo helps professionals like Xerrter Fertui boost their career" wide
	$path1 = "\\Gertiopertores\\Certiop.vdp" wide
	$process = "Smoothtiny"
	$compression = "!thiv qrobpam%ccgnnms bg'rsm\"in AIS'hlae."
	$path2 = "AKT -21092015-PowerPoint.exe"
	$path3 = "\\Documents\\chm\\AKT -21092015-PowerPoint.exe" wide
	$path4 = "C:\\Users\\A90B~1\\AppData\\Local\\Temp\\AKT -21092015-PowerPoint.exe"
	$path5 = "C:\\Users\\A90B~1\\AppData\\Local\\Temp\\AKT -21092015-PowerPoint.exe" wide
	$path6 = "AKT -21092015-PowerPoint.exe9" wide
	$path7 = "\\Documents\\chm\\AKT -21092015-PowerPoint.exe" wide
	$path8 = "C:\\Users\\836D~1\\AppData\\Local\\Temp\\PEWER POINT PRESENTATION.exe" wide
	$path9 = "PEWER POINT PRESENTATION.exe=" wide
	$path10 = "\\Documents\\PEWER POINT PRESENTATION.exe"
	$profile3 = "s Ainda precisam da uma melhorada nos pistols, pois a maioria dos jogos ja come" wide
condition:
    	any of them
}

rule early_october2015_vawtrak_dropper{
	meta:
		author = "Kevin Perlow"
		SHA256 = "3d1e7e54db786c6aef572d1ef57ad1c26413aacbf2fd91eb700d469c550dd4df"
		SHA256 = "3ffbe191d9326f97db4ffaf6b294c166397bf1c77d28e2ab44d41fca511ce55b"
    reference = "https://www.youtube.com/watch?v=DdkLY99HgAA"
	strings:
		$VBA = { 00 41 74 74 72 69 62 75 74 00 } //doc contains VBA
		$rtf = { 2E 72 74 66} //rtf in hex, will appear if in macro unofuscated
        $exe = {2E 65 78 65} //exe in hex
		$string1 = "TEMP$ 4"
		$string2 = /[0-9][0-9][0-9]\.rtf/
		$string3 = /[a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9]\.exe/
		$a = {d0 cf 11 e0}
		$string4 = /C:\\Aaa\\exe\\[0-9A-Za-z]*\.exe/
		$string5 =  /C:\\Users\\M\\AppData\\Local\\Temp\\[0-9A-Za-z]*\.exe/
		$string6 = "X:\\multiplexing\\limitations\\electr.pdb"
		$Dyreza = "C:\\Users\\Em\\AppData\\Local\\Temp\\w12.exe"
		$RSA = "This file is protected with RSA key." nocase
	condition:
		$a at 0 and $VBA and (($rtf and $exe) or 2 of ($string1,$string2,$string3) or 2 of ($string4,$string5,$string6) or 2 of ($Dyreza,$RSA))
}