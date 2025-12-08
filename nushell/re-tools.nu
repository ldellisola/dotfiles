def "nu-complete re bf02b3f7b4da2d1c9fe577b5405612accf8f8363" [] {
     ^re auth roles | lines | each { |line| $"\"($line | str trim)\""  }
}
def "nu-complete re 7f722f3e2ab9e438592d896b93d4dee6f474f685" [] {
     ^re ds list | lines | each { |line| $"\"($line | str trim)\""  }
}
def "nu-complete re 96df015f47c0a33f50ee1b8bef339d909a5e234e" [] {
     ^kubectl get service -o custom-columns=NAME:.metadata.name | lines | skip 1 | lines | each { |line| $"\"($line | str trim)\""  }
}


# Generates API Key for a user
export extern "re auth apikey" [
userId: string # User ID
--help(-h) # Show help
--secret(-s): string # use a custom secret
] 


	
# Assigns a role to a user
export extern "re auth roles add" [
usernameOrReId: string # Username or RE ID
	role: string@"nu-complete re bf02b3f7b4da2d1c9fe577b5405612accf8f8363"  # Role to assign
--help(-h) # Show help

] 


# List all roles
export extern "re auth roles" [

--help(-h) # Show help
--username-or-re-id(-u): string # Optional Username or RE ID to get roles for
] 


	
# Remove a role to a user
export extern "re auth roles del" [
usernameOrReId: string # Username or RE ID
	role: string@"nu-complete re bf02b3f7b4da2d1c9fe577b5405612accf8f8363"  # Role to assign
--help(-h) # Show help

] 


# Saves the nushell completions to a file if it is specified as NUSHELL_COMPLETIONS_FILE variable.    If not, it will just print it to the console
export extern "re nushell" [

--help(-h) # Show help

] 

	
def RystadEnergy.Tools.Commands.CubeBrowser.ChangeServerCommand_server [] { [ "jonas" , "sofie03" , "sofie04" , "sofie05" , "sofie06" , "sofie14" , "sofie15" , "sofie21" , "sofie22" , "https://reserver01.rystadenergy.com" , "https://reserver02.rystadenergy.com" , "https://reserver03.rystadenergy.com" ] }
# Change server for Cube Browser
export extern "re cb server" [
server: string@RystadEnergy.Tools.Commands.CubeBrowser.ChangeServerCommand_server # New server
--help(-h) # Show help
--file(-f): string # optional path to config file
	--launch(-l)
] 
def RystadEnergy.Tools.Commands.CubeBrowser.OpenCubeBrowserCommand_server [] { [ "jonas" , "sofie03" , "sofie04" , "sofie05" , "sofie06" , "sofie14" , "sofie15" , "sofie21" , "sofie22" , "https://reserver01.rystadenergy.com" , "https://reserver02.rystadenergy.com" , "https://reserver03.rystadenergy.com" ] }
	

# Open Cube Browser
export extern "re cb" [
cube: string@"nu-complete re 7f722f3e2ab9e438592d896b93d4dee6f474f685"  # Cube to open
--help(-h) # Show help
--server(-s): string@RystadEnergy.Tools.Commands.CubeBrowser.OpenCubeBrowserCommand_server # optional server
	--username(-u): string # Username to login
] 

	

# Get cube version directly from Analysis Services
export extern "re cube version" [

--help(-h) # Show help
--cube(-c): string # Cube name
	--connection-string(-s): string # Connection string
] 


# Execute an OLAP query
export extern "re cube query" [
connectionString: string # Connection string
--help(-h) # Show help

] 


# Get a set of cubes from a connection string from Analysis Services
export extern "re cube list" [
connectionString: string # Connection string
--help(-h) # Show help

] 


# Get cube version directly from Analysis Services
export extern "re cube units" [
unitsFile: string # -s, Connection string
--help(-h) # Show help
--search(-s): string # Connection string
] 

	
	
	

# Shows a given data source.
export extern "re ds" [
dataSourceName: string@"nu-complete re 7f722f3e2ab9e438592d896b93d4dee6f474f685"  # Data Source Name
--help(-h) # Show help
--username(-u): string # Username to login, default ldellisola
	--show-version
	--show-info
	--show-license
] 


# Get data source info
export extern "re ds list" [

--help(-h) # Show help

] 

	def RystadEnergy.Tools.Commands.Eunomia.DeleteMeasurementCommand_env [] { [ "stage" , "prod" ] }

	
# Deletes a measurement from InfluxDB
export extern "re eunomia delete" [
bucket: string # Bucket to delete from
	measurement: string # Measurement to delete
--help(-h) # Show help
--look-back(-l): string # lookback in days, hours or minutes
	--env(-e): string@RystadEnergy.Tools.Commands.Eunomia.DeleteMeasurementCommand_env # environment to use
] 
def RystadEnergy.Tools.Commands.Eunomia.RenameDataSourceCommand_env [] { [ "stage" , "prod" ] }
	

	
# 
export extern "re eunomia ds rename" [
originalDataSourceName: string
	newDataSourceName: string
--help(-h) # Show help
--env: string@RystadEnergy.Tools.Commands.Eunomia.RenameDataSourceCommand_env
	--look-back: string
] 


# Writes information about re tools
export extern "re info" [

--help(-h) # Show help

] 
def RystadEnergy.Tools.Cli.Commands.Kubernetes.RestartMessageConsumersCommand_env [] { [ "stage" , "prod" ] }

# Restart all pods that are affected by rabbitmq issues
export extern "re k8s fix-message-consumers" [

--help(-h) # Show help
--env(-e): string@RystadEnergy.Tools.Cli.Commands.Kubernetes.RestartMessageConsumersCommand_env # K8s environment
] 

	def RystadEnergy.Tools.Cli.Commands.Kubernetes.RestartServiceCommand_env [] { [ "stage" , "prod" ] }

# Restarts all pods of a service
export extern "re k8s restart" [
service: string@"nu-complete re 96df015f47c0a33f50ee1b8bef339d909a5e234e"  # Service to restart
--help(-h) # Show help
---@namespace: string
	--env(-e): string@RystadEnergy.Tools.Cli.Commands.Kubernetes.RestartServiceCommand_env # K8s environment
] 


# Show a user's profile history
export extern "re user history" [
id: string # RE ID, username or Email
--help(-h) # Show help
--include-products
] 