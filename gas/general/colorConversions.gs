// These scripts will have conversions I often need, starting from, but not limited to color conversions.
// add: hsl, hsla, rbga, hexa, maybe also: pms (pantone matching system) and ral (used in coatings)
// other conversions: metric/imperial

/*
function testConv() {
  let hexcolor = '#32A852';
  let rgbcolor = hexToRgb(hexcolor);
  console.log('The RGB color that corresponds to Hex color '+hexcolor+' is ('+rgbcolor[0]+', '+rgbcolor[1]+', '+rgbcolor[2]+')');
}
*/

function decToHex(dec) {
  const hex = dec.toString(16);
  return hex.length == 1 ? "0" + hex : hex;
}

function hexToRgb(hex) {
  let rgb = [
    parseInt(hex.substr(-6, 2), 16),
    parseInt(hex.substr(-4, 2), 16),
    parseInt(hex.substr(-2), 16)
  ];
  return rgb;
}

function rgbToHex(rgb) {
  let rhex = decToHex(rgb[0]);
  let ghex = decToHex(rgb[1]);
  let bhex = decToHex(rgb[2]);

  let hex = '#'+rhex+ghex+bhex;
  return hex;

}

function rbgToCmyk(rgb) {
  let r = Math.round((rgb[0]/255 + Number.EPSILON)*100)/100;
  let g = Math.round((rgb[1]/255 + Number.EPSILON)*100)/100;
  let b = Math.round((rgb[2]/255 + Number.EPSILON)*100)/100;
  
  let rgbMax = Math.max(r, g, b);

  let k = Math.round(1 - rgbMax);
  let c = Math.round(((1 - (r + k)) / rgbMax)*100);
  let m = Math.round(((1 - (g + k)) / rgbMax)*100); 
  let y = Math.round(((1 - (b + k)) / rgbMax)*100);
  k = k*100;

  let cmyk = [c, m, y, k];
  
  return cmyk;
}

function cmykToRgb(cmyk) {
  let c = cmyk[0]/100;
  let m = cmyk[1]/100;
  let y = cmyk[2]/100;
  let k = cmyk[3]/100;

  let r = Math.round(255 * (1 - c) * (1 - k));
  let g = Math.round(255 * (1 - m) * (1 - k));
  let b = Math.round(255 * (1 - y) * (1 - k));

  let rgb = [r, g, b];

  return rgb;
}

function hexToCmyk(hex) {
  let rgb = hexToRgb(hex);
  let cmyk = rbgToCmyk(rgb);
  return cmyk;
}

function cmykToHex(cmyk) {
  let rgb = cmykToRgb(cmyk);
  let hex = rgbToHex(rgb);
  return hex;
}
