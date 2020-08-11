# clockify-desktop
## Known Issues
- Exiting Clockify's Desktop App does not terminate the container.
  The application might still be running in background,
  e.g. wanting to go in the notification bar.
  
  There is currently no workaround other than sending a stop signal
  to the container. 
- Randomly crashes or hangs during its startup before crashing on its own
  happens whenever we mount it a folder,
  for example `-v clockify-data/.config:/path/to/its/home/.config"`.
