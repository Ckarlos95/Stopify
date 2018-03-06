- active = context.request.path == "/" ? "active" : ""
a class="nav-item #{active}" href="/" Home
- active = context.request.path == "/artists" ? "active" : ""
a class="nav-item #{active}" href="/artists" Artists
- active = context.request.path == "/albums" ? "active" : ""
a class="nav-item #{active}" href="/albums" Albums
