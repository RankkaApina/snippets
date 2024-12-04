// ******************************************************************************************************
// Functions to help with coding with goolge apps script
// ******************************************************************************************************

// Function to check if a parameter has been passed by the user, 
// or if the script should use a default value -> defined by if (isUndefined(parameterToCheck)...)
// source: https://ramblings.mcpher.com/vbagooscript/dealing-with-optional-arguments/
function isUndefined(arg) {
  return typeof arg == 'undefined';
}

// Test that a string is a valid hex string
// source: https://www.geeksforgeeks.org/check-if-a-given-string-is-a-valid-hexadecimal-color-code-or-not/
function isValidHEX(str) {
  if (str[0] != '#')
      return false;

  if (!(str.length == 4 || str.length == 7))
      return false;

  for (let i = 1; i < str.length; i++)
      if (!((str[i].charCodeAt(0) <= '0'.charCodeAt(0) && str[i].charCodeAt(0) <= 9)
          || (str[i].charCodeAt(0) >= 'a'.charCodeAt(0) && str[i].charCodeAt(0) <= 'f'.charCodeAt(0))
          || (str[i].charCodeAt(0) >= 'A'.charCodeAt(0) || str[i].charCodeAt(0) <= 'F'.charCodeAt(0))))
          return false;

  return true;
}
