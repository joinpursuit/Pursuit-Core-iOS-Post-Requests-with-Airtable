# Base Project

![gif](./projectGif.gif)

# Lab

Using this project as your base, add the following two VCs.  Note: the project will not compile because it does not have a `Secrets.swift`.  Add one with your own secrets (Project ID and API Key).  For a refresher on where to locate those, read section six at the lesson [here](https://github.com/joinpursuit/Pursuit-Core-iOS/blob/master/networking-concurrency-apis/post-requests/README.md)

## 1. Clients list

Create a new tab that loads all of the Clients in the "Clients" tab.  Clients should be loaded into a custom cell that shows the logo image.

## 2. Add client VC

Add a button at the top of the Clients list that segues to a new VC.  Have fields for the `name`, and `about` fields.  Clicking on a `submit` button will post the new client to your Airtable.

BONUS: Add an option to upload a logo image.
