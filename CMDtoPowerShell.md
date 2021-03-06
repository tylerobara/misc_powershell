## PowerShell Equivalents

### Networking
	
	ipconfig		->	`Get-NetIPConfiguration OR Get-NetIPAddress`
	
	ping 			->	Test-NetConnection -ComputerName
	
	#test port connect	->	Test-NetConnection "Hostname or IP" -Port #
	
	tracert			-> 	Test-NetConnection "Hostname or IP" -traceroute
	
	nslookup		->	Resolve-DnsName -Name "Hostname"
	
	netstat			->	Get-NetTCPConnection
	
	#dns info		->	Get-DnsClient
	
	net use			->	New-PSDrive –Name “{letter}” –PSProvider FileSystem –Root “\\{IP or hostname}\{share}” –Persist
	
	net share		->	New-SmbShare
	
	net view		->	Get-SmbShare
	
	net session		->	Get-SmbSession
	
				->	Get-SmbConnection
	
	list remote shares	->	get-WmiObject -class Win32_Share -computer {hostname or ip}
	
	ssh			->	New-PSSession -ComputerName {hostname or ip} #note://set to a variable ($session=New-PSSession ...) so it call be called later, see 'scp/Copy-Item'
	
	scp			->	Copy-Item -Path {path} -ToSession {session} -Destination '{destination path}' #note://{session} should be called as variable, see 'New-PSSession'
	
	ipconfig		->	Get-NetIPConfiguration (Get-NetIPAddress)
	
	#DNSCLientCache		->	Get-DNSClientCache
	
	netsh interface portproxy->	Nothing?!?

### Process/Services/Tasks
	
	tasklist		->	Get-Process
	
	sc			->	Get-Service
	
	schtasks		->	Get-ScheduledTask
	

### General
	
	help or /?		-> 	Get-Help {command}
	
	copy			->	Copy-Item
	
	#'touch' or new		-> 	New-Item
	
	wmic {command}		->	Get-WmiObject win32_{command}
	
	findstr			->	Get-Child Item {path} | Select-String -Pattern "{string}"
	
	robocopy		->	Copy-Item -Path {path} -Destination {destination}  #remote destination '\\10.0.0.50\c$\....'
	
	certutil -hashfile	->	Get-FileHash #note://Win8+ only
	
	doskey /history		->	Get-History or history
	
	#full terminal history	->	(Start/Stop)-Transaction
	
	reg query		->	Get-ChildItem {eg HKLM:\} or Get-ItemProperty {HKLM:\Software\Microsoft\Windows\currentVersion\Run}
	
	reg delete		-> 	Remove-Item OR Remove-ItemProperty
	
	reg add			->	New-Item OR New-ItemProperty
	
	#hotfixes		-> 	Get-Hotfix


################################

Legend
	
	# - Unknown CMD equivalent
	
	

	



