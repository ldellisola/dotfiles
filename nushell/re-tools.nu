def "nu-complete re 7f722f3e2ab9e438592d896b93d4dee6f474f685" [] {
     ^re ds list | lines | each { |line| $"\"($line | str trim)\""  }
}
def "nu-complete re 96df015f47c0a33f50ee1b8bef339d909a5e234e" [] {
     ^kubectl get service -o custom-columns=NAME:.metadata.name | lines | skip 1 | lines | each { |line| $"\"($line | str trim)\""  }
}


export extern "re nushell" [


] 

	
def RystadEnergy.Tools.Commands.CubeBrowser.ChangeServerCommand_server [] { [ "jonas" , "sofie03" , "sofie04" , "sofie14" , "sofie15" , "sofie21" , "sofie22" , "https://reserver01.rystadenergy.com" , "https://reserver02.rystadenergy.com" , "https://reserver03.rystadenergy.com" ] }
export extern "re cb server" [
server: string@RystadEnergy.Tools.Commands.CubeBrowser.ChangeServerCommand_server
--file(-f): string
	--launch(-l)
] 
def RystadEnergy.Tools.Commands.CubeBrowser.OpenCubeBrowserCommand_server [] { [ "jonas" , "sofie03" , "sofie04" , "sofie14" , "sofie15" , "sofie21" , "sofie22" , "https://reserver01.rystadenergy.com" , "https://reserver02.rystadenergy.com" , "https://reserver03.rystadenergy.com" ] }
	

export extern "re cb" [
cube: string@"nu-complete re 7f722f3e2ab9e438592d896b93d4dee6f474f685" 
--server(-s): string@RystadEnergy.Tools.Commands.CubeBrowser.OpenCubeBrowserCommand_server
	--username(-u): string
] 

	

export extern "re cube version" [

--cube(-c): string
	--connection-string(-s): string
] 


export extern "re ds info" [
dataSourceName: string@"nu-complete re 7f722f3e2ab9e438592d896b93d4dee6f474f685" 

] 


export extern "re ds version" [
dataSourceName: string@"nu-complete re 7f722f3e2ab9e438592d896b93d4dee6f474f685" 

] 


export extern "re ds list" [


] 

	def RystadEnergy.Tools.Commands.Eunomia.DeleteMeasurementCommand_env [] { [ "stage" , "prod" ] }

	
export extern "re eunomia delete" [
bucket: string
	measurement: string
--look-back(-l): string
	--env(-e): string@RystadEnergy.Tools.Commands.Eunomia.DeleteMeasurementCommand_env
] 
def RystadEnergy.Tools.Commands.Eunomia.RenameDataSourceCommand_env [] { [ "stage" , "prod" ] }
	

	
export extern "re eunomia ds rename" [
originalDataSourceName: string
	newDataSourceName: string
--env: string@RystadEnergy.Tools.Commands.Eunomia.RenameDataSourceCommand_env
	--look-back: string
] 


export extern "re info" [


] 

	def RystadEnergy.Tools.Cli.Commands.Kubernetes.RestartServiceCommand_env [] { [ "stage" , "prod" ] }

export extern "re k8s restart" [
service: string@"nu-complete re 96df015f47c0a33f50ee1b8bef339d909a5e234e" 
---@namespace: string
	--env(-e): string@RystadEnergy.Tools.Cli.Commands.Kubernetes.RestartServiceCommand_env
] 


export extern "re spectre apikey" [
userId: string
--secret(-s): string
] 