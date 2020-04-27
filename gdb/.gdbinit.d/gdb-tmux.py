import libtmux
import os

def get_active_session_id():
    return "$%s" % os.environ['TMUX'].split(',')[-1]

tmux_server = libtmux.Server()
session = tmux_server.get_by_id(get_active_session_id())

attached_window = session.attached_window
attached_window.set_window_option('remain-on-exit', 1)
dashboard_pane = attached_window.split_window(attach=False, vertical=False)
dashboard_pane.cmd('respawn-pane', '-k', 'cat')
tmux_server._update_panes()
gdb.execute('dashboard -output %s' % (dashboard_pane.get('pane_tty'),))

#  app_pane = attached_window.split_window(attach=False, vertical=True)
app_pane = dashboard_pane.split_window(attach=False, vertical=True)
app_pane.cmd('respawn-pane', '-k', 'sleep', '999d')
tmux_server._update_panes()
tty = app_pane.get('pane_tty')
gdb.execute('tty %s' % (tty,))
