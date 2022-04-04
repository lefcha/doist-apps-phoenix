# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     DoistApps.Repo.insert!(%DoistApps.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
DoistApps.Repo.insert!(%DoistApps.User.App{                                     
    user_id: "1",                                                               
    name: "Test",                                                               
    description: "A test app",                                                  
    redirect_uri: "https://example.com/oauth"                                   
})                                                                              
DoistApps.Repo.insert!(%DoistApps.User.App{                                     
    user_id: "2",                                                               
    name: "Demo",                                                               
    description: "A demo app",                                                  
    redirect_uri: "https://example.org/oauth"                                   
})
