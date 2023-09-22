# Get-DellWarranty PowerShell Script: The Warranty Whisperer 🕵️‍♂️

## What's This?

You've got Dell computers, and you've got questions. "Is this thing still under warranty?" you wonder as you sip your third cup of coffee. Well, wonder no more! This PowerShell script is your new BFF. It fetches warranty info faster than you can say "Dude, you're getting a Dell!"

## Requirements: The Nitty-Gritty 🛠️

- Dell API Key: Because Dell doesn't just let any Tom, Dick, or Harry access their secret warranty sauce.
- PowerShell: If you don't know what this is, you're in the wrong README, buddy.

## How to Get a Dell API Key: The Quest 🗺️

1. Go to [Dell TechDirect](https://techdirect.dell.com/).
2. Click on "Register Now" like you're clicking on the "Skip Ad" button on YouTube.
3. Fill out the form. Yes, all of it.
4. Wait for approval. Use this time to contemplate your life choices.
5. Once approved, navigate to the API section and generate your key. Guard it like it's the One Ring.

## Usage: How to Make the Magic Happen 🎩

### Pipe from `Get-ADComputer`: For the Overachievers

```powershell
Get-ADComputer -Filter * | Select-Object -ExpandProperty Name | .\Get-DellWarranty.ps1
```

### Command-line Argument: For the Minimalists

```powershell
.\Get-DellWarranty.ps1 -ServiceTag "YourServiceTagHere"
```

### Text File with Service Tags: For the Hoarders

```powershell
.\Get-DellWarranty.ps1 -ServiceTagFile "path\to\your\file.txt"
```

## Parameters: The Knobs and Dials 🎛️

- `-ServiceTag`: The Dell service tag. Not your luggage tag.
- `-ApiKey`: Your Dell API key. Default is "YourAPIKeyHere", but don't be that guy.
- `-ServiceTagFile`: Path to a text file containing one service tag per line. For when one just isn't enough.

## Output: The Moment of Truth 🥁

The script outputs a table with:

- `ServiceLevelDescription`: What kind of VIP treatment your Dell is getting.
- `StartDate`: When the party started.
- `EndDate`: When Cinderella's carriage turns back into a pumpkin.

## Author: Joe Hancuff

Because someone has to take the credit (or the blame).

