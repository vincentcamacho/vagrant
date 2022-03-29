apt update -y && apt upgrade -y
timedatectl set-timezone Europe/Paris

apt install -y git vim curl wget tree gnupg2

usuario=vincent
useradd -U $usuario -m -s /bin/bash -G sudo
echo "$usuario:123" | chpasswd
echo "$usuario ALL=(ALL) NOPASSWD: ALL" | tee -a /etc/sudoers

echo "vagrant ALL=(ALL) NOPASSWD: ALL" | tee -a /etc/sudoers
echo "vagrant:123" | chpasswd
echo "root:123" | chpasswd

sed -i /etc/sudoers -re 's/^%sudo.*/%sudo ALL=(ALL:ALL) NOPASSWD: ALL/g'
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/^#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config
systemctl restart sshd