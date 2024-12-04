// ******************************************************************************************************
// Functions related to user time
// Time zone can be pulled from the file, but it's generally the file owner's timezone, so using 
// Google Calendar is more likely to give a desired result
// ******************************************************************************************************

// Get user time zone for timestamp creation
function getUserTimeZone() {
  let userTimeZone = CalendarApp.getDefaultCalendar().getTimeZone();
  return userTimeZone;
}

// Get creation timestamp in desired format
function creationTS(id, tz) {
  const f = DriveApp.getFileById(id);
  const creation = f.getDateCreated();
  let cdate = Utilities.formatDate(creation, tz, "yyyy-MM-dd HH:mm:ssXXX");
  return cdate;
}

// Get last update timestamp in desired format
function lastUpdatedTS(id, tz) {
  const f = DriveApp.getFileById(id);
  const update = f.getLastUpdated();
  let lastUpdated = Utilities.formatDate(update, tz, "yyyy-MM-dd HH:mm:ssXXX");
  return lastUpdated;
}