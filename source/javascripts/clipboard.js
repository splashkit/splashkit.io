$(document).ready(function () {
  var sel = '*[data-clipboard]';
  var els = document.querySelectorAll(sel);
  var clipboardTargetFor = function(el) {
    return $(el.getAttribute('data-clipboard-target'))[0] || el;
  }
  var showPopover = function(el, msg, show) {
    $(el).popover('dispose');
    $(el).popover({
      trigger: 'hover',
      placement: el.getAttribute('data-clipboard-placement') || 'bottom',
      content: msg
    });
    if (show) {
      setTimeout(function() {
        $(el).popover('show');
      }, 250);
    }
  }

  var clipboard = new Clipboard(sel);
  clipboard.on('success', function(e) {
    var el = clipboardTargetFor(e.trigger);
    showPopover(el, 'Copied!', true);
  });
  clipboard.on('failure', function(e) {
    var actionMsg;
    if (/iPhone|iPad/i.test(navigator.userAgent)) {
      actionMsg = 'No support :(';
    }
    else if (/Mac/i.test(navigator.userAgent)) {
      actionMsg = 'Press ⌘-C to copy';
    }
    else {
      actionMsg = 'Press Ctrl-C to copy';
    }
    var el = clipboardTargetFor(e.trigger);
    showPopover(el, actionMsg, true);
  });

  for (var i = 0; i < els.length; i++) {
    var el = clipboardTargetFor(els[i]);
    showPopover(el, 'Click to copy');
    el.addEventListener('mouseleave', function(e) {
      showPopover(clipboardTargetFor(e.target), 'Click to copy');
    });
  }
})
