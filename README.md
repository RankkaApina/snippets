# README

Collection of snippets in different programming languages that might be of use to someone else too.

## gas

My personal google apps scripts snippets.

### General

#### `codingUtilities.gs`

This file has generally useful coding utilities for any app using Google Apps Scripts. 
- `isUndefined(arg)`: This can be used to check if user gave the argument. This is for scripts that have a default argument for this case.
- `isValidHEX(str)`: This is to check that the string given as HEX color is actually valid color definition.

#### `colorConversions.gs`

This includes functions to convert different color formats to whatever you need in your script. Currently includes color conversions to and from RGB, HEX, and CMYK.

#### `timeUtilities.gs`

Functions that give user's time zone and timestamp in a specific format. Also file creation or update times.
- `getUserTimeZone()`: gets user's time zone from Google Calendar. You can also pull time zone from the file, but this is generally the file owner's time zone, so Calendar App is more likely to give you a result you are looking for.
- `creationTS(id, tz)`: returns file creation timestamp in user's time zone in "yyyy-MM-dd HH:mm:ssXXX" format
- `lastUpdatedTS(id, tz)`: returns the timestamp of the last update on the file in user's time zone in "yyyy-MM-dd HH:mm:ssXXX" format

## vba

My vba snippets to use with Office products (2019).

### PowerPoint

- `CheckFooterPlaceholders`
- `NameShapes`
- `UpdateFooters`

### Word

- `StylesTOCAutoUpdate`