function! s:TrackerRegister(filename)
python << endpython
try:
    obj = bus.get_object('com.savidworks.TimeTracker', '/com/savidworks/TimeTracker')
except dbus.exceptions.DBusException:
    print "Time Tracker not running"
else:
    TrackThread(obj=obj,func='register', filename=vim.eval("a:filename")).start()
endpython
endfunction

function! s:TrackerUnregister()
python << endpython
try:
    obj = bus.get_object('com.savidworks.TimeTracker', '/com/savidworks/TimeTracker')
except dbus.exceptions.DBusException:
    print "Time Tracker not running"
else:
    TrackThread(obj=obj,func='unregister').start()
endpython
endfunction

python << endpython
import warnings
warnings.filterwarnings('ignore')
import os, gio, vim, dbus, gobject, threading
from time_tracker import categories
bus = dbus.SessionBus()
# We're using a thread b/c the dbus call is slow, and we don't want to wait 1-2 seconds while
# working in Vim.  This essentially makes the call asynchronous
class TrackThread(threading.Thread):
    def __init__(self, obj, func='register', filename=None):
        self.obj = obj
        self.func = func
        self.filename = filename
        threading.Thread.__init__(self)

    def run(self):
        #get window title (remove modified flags, etc.)
        data = {
            'window_id': window_id,
            'window_title': title,
            'app_name': 'Vim',
            'uri': uri,
            'category': categories.CATEGORY_DOCUMENT,
            'mimetype': mimetype,
        }
        if self.func == 'register':
            f = gio.File(self.filename)
            uri = f.get_uri()
            mimetype = f.query_info(gio.FILE_ATTRIBUTE_STANDARD_CONTENT_TYPE).get_content_type()
            window_id = os.getenv('WINDOWID')
            if window_id:
                self.obj.register_task(data)
        elif self.func == 'unregister':
            window_id = os.getenv('WINDOWID')
            obj = bus.get_object('com.savidworks.TimeTracker', '/com/savidworks/TimeTracker')
            obj.unregister_task(window_id)
endpython
augroup timetracker
au!
au BufEnter * call <SID>TrackerRegister (expand("%:p"))
au FocusGained * call <SID>TrackerRegister (expand("%:p"))
"au CursorMoved * call <SID>TrackerRegister (expand("%:p"))
"au CursorMovedI * call <SID>TrackerRegister (expand("%:p"))
au FocusLost * call <SID>TrackerUnregister ()
au BufUnload * call <SID>TrackerUnregister ()
au BufLeave * call <SID>TrackerUnregister ()
au VimLeave * call <SID>TrackerUnregister ()
augroup end
