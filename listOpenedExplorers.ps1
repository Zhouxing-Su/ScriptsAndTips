$app = New-Object -COM 'Shell.Application'
$app.Windows() | Select-Object LocationURL