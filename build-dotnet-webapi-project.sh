#git clone / set credentials
git clone https://github.com/sabsfilho/user-registration-k8s-dotnet
git config --global user.name "type name"
git config --global user.email "type email"
#create project structure
#https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-new
dotnet new gitignore
md UserRegisrationLib
cd UserRegisrationLib
dotnet new classlib -f net8.0
cd ..
md UserRegisrationApp
cd UserRegisrationApp
dotnet new web -f net8.0
dotnet add reference UserRegistrationLib/UserRegistrationLib.csproj
cd ..
dotnet new sln --name UserRegistration
dotnet sln add UserRegistrationLib
dotnet sln add UserRegistrationApp
dotnet run --project UserRegistrationApp
#simple webapi mounted so far...
