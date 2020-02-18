@cloud
Feature: CloudFoundry Configuration
    In order to show you how to use Steeltoe for CloudFoundry configurations
    You can run some CloudFoundry configuration samples

    @netcoreapp3.0
    @win10-x64
    Scenario Outline: CloudFoundry Configuration for .Net Core 3.0 (win10-x64)
        Given you have at least .Net Core SDK 3.0.100 installed
        When you run: dotnet restore
        And you run: dotnet publish -f netcoreapp3.0 -r win10-x64
        And you run in the background: cf push -f manifest-windows.yml -p bin/Debug/netcoreapp3.0/win10-x64/publish
        And you wait until CloudFoundry app cloud is started
        When you get https://cloud.x.y.z/Home/CloudFoundry
        Then you should see "vcap:application:application_name = cloud"

    @netcoreapp3.0
    @ubuntu.16.04-x64
    Scenario: CloudFoundry Configuration for .Net Core 3.0 (ubuntu.16.04-x64)
        Given you have at least .Net Core SDK 3.0.100 installed
        When you run: dotnet restore
        And you run: dotnet publish -f netcoreapp3.0 -r ubuntu.16.04-x64
        And you run in the background: cf push -f manifest.yml -p bin/Debug/netcoreapp3.0/ubuntu.16.04-x64/publish
        And you wait until CloudFoundry app cloud is started
        When you get https://cloud.x.y.z/Home/CloudFoundry
        Then you should see "vcap:application:application_name = cloud"
