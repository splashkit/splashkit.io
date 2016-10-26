$(document).ready(function () {
  var sel = '*[data-clipboard]';
  var els = document.querySelectorAll(sel);

  var clipboard = new Clipboard(sel);
  clipboard.on('success', function(e) {
    e.trigger.setAttribute('aria-label', 'Copied to clipboard');
    $(e.trigger).popover('show');
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
    el.setAttribute('aria-label', actionMsg);
    $(e.trigger).popover('show');
  });

  for (var i = 0; i < els.length; i++) {
    var el = els[i];
    var actionMsg = 'Click to copy';
    el.setAttribute('aria-label', actionMsg);
    $(el).popover({
      trigger: 'hover',
      placement: 'bottom',
      content: function() {
        return el.getAttribute('aria-label');
      }
    });
    el.addEventListener('mouseleave', function(e) {
      el.setAttribute('aria-label', actionMsg);
    });
  }
})
