#General requirements of the script
sudo apt update && sudo apt upgrade -y;
sudo apt install lshw-gtk -y;
sudo dpkg --add-architecture i386;
# Next to install Wine Stuff (above was required setups)
sudo mkdir -pm755 /etc/apt/keyrings;
wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo gpg --dearmor -o /etc/apt/keyrings/winehq-archive.key -;
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/noble/winehq-noble.sources;
sudo apt update && sudo apt install --install-recommends winehq-stable -y;
# Add Multiverse (allows skype and steam to work!)
sudo add-apt-repository multiverse;
# Requires user input - enter.
sudo snap install discord; #Discord Gamers...Discord!
sudo apt install cpu-checker -y;
sudo apt install flatpak -y; #Flatpak yo....this helps install things easier.
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo;
flatpak install flathub org.blender.Blender -y; #Blender!
# Winetricks -> Helps Wine things run.
wget  https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks;
chmod +x winetricks;
sudo mv -v winetricks /usr/local/bin;
sudo apt-get install cabextract p7zip unrar unzip wget zenity -y;

# NEXT UP IS Lutris - options.
PS3='>-> Do you Want To Install Lutris (Another Games Launcher) (1 or 2) '
options=("Yes" "No")
select opt in "${options[@]}"
do
    case $opt in
        "Yes")
            # Put in request to actually install file topia
            sudo apt install lutris -y;
            break
            ;;
        "No")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
# Neofetch is cool
sudo apt install neofetch -y;
# Media Player
sudo apt install vlc -y;
sudo apt-get install bless -y;
sudo apt install -y gnupg2;
sudo apt-get install xclip -y;

PS3='>-> Do you Want To Install Heroic Games Launcher (Allows Epic Games/Gog/Amazon Games) (1 or 2) '
options=("Yes" "No")
select opt in "${options[@]}"
do
    case $opt in
        "Yes")
			flatpak install flathub com.heroicgameslauncher.hgl -y;
            break
            ;;
        "No")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

PS3='>-> Do you Want To Install Kodi (Media Player) (1 or 2) '
options=("Yes" "No")
select opt in "${options[@]}"
do
    case $opt in
        "Yes")
			flatpak install flathub tv.kodi.Kodi -y;
            break
            ;;
        "No")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

PS3='>-> Do you Want To Install Steam (1 or 2) '
options=("Yes" "No")
select opt in "${options[@]}"
do
    case $opt in
        "Yes")
            sudo apt install steam -y
            break
            ;;
        "No")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
# VMs allow you to use Subsystems such as Windows inside it. Its optional.
PS3='>-> Do you Want To Install Virtual Machines? (1 or 2) '
options=("Yes" "No")
select opt in "${options[@]}"
do
    case $opt in
        "Yes")
			sudo apt install qemu-kvm virt-manager virtinst libvirt-clients bridge-utils libvirt-daemon-system -y;
			sudo systemctl enable --now libvirtd;
			sudo systemctl start libvirtd;
			# Enables Current User Access to KVM
			sudo usermod -aG kvm $USER;
			sudo usermod -aG libvirt $USER;
			sudo apt-key adv --keyserver hkps://keyserver.ubuntu.com:443 --recv-keys 379CE192D401AB61;
            break
            ;;
        "No")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
sudo apt update && sudo apt upgrade -y;
# Few Fixes to make sure things run easier for you.
wget http://launchpadlibrarian.net/279485070/libgcrypt11_1.5.3-2ubuntu4.4_amd64.deb;
wget http://archive.ubuntu.com/ubuntu/pool/main/g/glibc/multiarch-support_2.27-3ubuntu1_amd64.deb;
sudo apt-get install ./multiarch-support_2.27-3ubuntu1_amd64.deb;
# Setup the file from above
sudo dpkg -i libgcrypt11_1.5.3-2ubuntu4.4_amd64.deb;
sudo apt install ffmpeg -y;

# Kate Editing Processor (very nice text based stuff)
sudo apt install kate -y;
sudo apt install shotwell -y;
sudo apt-get install bash flatpak git jq libfuse2 rsync -y;
sudo apt autoremove -y;
sudo apt update;
sudo apt upgrade -y;
sudo apt install net-tools -y;
sudo apt install gedit -y;
flatpak install flathub org.gabmus.hydrapaper -y;

PS3='>-> Do You Want To Install Opera Web Browser? (1 or 2) '
options=("Yes" "No")
select opt in "${options[@]}"
do
    case $opt in
        "Yes")
			flatpak install flathub com.opera.Opera;
            break
            ;;
        "No")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

# It would be proven to make the netframework first then move around. 
wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh;
chmod +x ./dotnet-install.sh;
./dotnet-install.sh --version latest;
wget https://packages.microsoft.com/config/ubuntu/24.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb;
sudo dpkg -i packages-microsoft-prod.deb;
rm packages-microsoft-prod.deb;
sudo apt update;
# Install dotnet sdk 8.0 - purrrrrfect.
sudo apt install dotnet-sdk-8.0 -y;
sudo apt install gigolo -y;
wget https://packages.microsoft.com/config/ubuntu/24.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb;
sudo dpkg -i packages-microsoft-prod.deb;
rm packages-microsoft-prod.deb;
cd;
wget https://dl.winehq.org/wine/wine-gecko/2.47.2/wine-gecko-2.47.2-x86_64.tar.xz;
sudo mkdir -p /usr/share/wine/gecko;
sudo tar xf wine-gecko-2.47.2-x86_64.tar.xz -C /usr/share/wine/gecko;
wineboot -u;

PS3='>-> Do You Want To Use Mullvad Browser? (1 or 2) '
options=("Yes" "No")
select opt in "${options[@]}"
do
    case $opt in
        "Yes")
            sudo curl -fsSLo /usr/share/keyrings/mullvad-keyring.asc https://repository.mullvad.net/deb/mullvad-keyring.asc;
			# Add the Mullvad repository server to apt
			echo "deb [signed-by=/usr/share/keyrings/mullvad-keyring.asc arch=$( dpkg --print-architecture )] https://repository.mullvad.net/deb/stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/mullvad.list;
			# Install the package
			sudo apt update;
			sudo apt install mullvad-browser -y;
            break
            ;;
        "No")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

