# https://help.gnome.org/admin/system-admin-guide/stable/login-userlist-disable.html.en

# Create the gdm profile which contains the following lines:
cat > /etc/dconf/profile/gdm << EOF
    user-db:user
    system-db:gdm
    file-db:/usr/share/gdm/greeter-dconf-defaults
    # gdm is the name of a dconf database.
EOF

# Create a gdm keyfile for machine-wide settings in 
cat > /etc/dconf/db/gdm.d/00-login-screen << EOF
    [org/gnome/login-screen]
    # Do not show the user list
    disable-user-list=true
EOF

# Update the system databases:
dconf update
