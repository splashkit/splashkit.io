/**
 * Allows the selection of a snippet element (not just inputs and textareas)
 */
function selectSnippet(element) {
  var rangeObj, selection;
  var element = element.querySelector('.tab-pane.active .rouge-code');
  if (document.createRange) { // IE >=9 and all other browsers
    rangeObj = document.createRange();
    rangeObj.selectNodeContents(element);
    selection = window.getSelection();
    selection.removeAllRanges();
    selection.addRange(rangeObj);
  } else if (document.body.createTextRange) { // IE <9
    rangeObj = document.body.createTextRange();
    rangeObj.moveToElementText(element);
    rangeObj.select();
  }
}
