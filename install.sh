USERNAME="edenatholberton"
REPONAME="C31-sandbox-setup-script"
USEREMAIL="15682@holbertonstudents.com"
NAME="edenatholberton"
REPOS=("holbertonschool-shell" "holbertonschool-github-flow" "holbertonschool-low_level_programming")

echo "hello getting bashrc";
if [[ -f ~/.bashrc ]]; then
  mv ~/.bashrc ~/.bashrc.bak;
fi
wget -qO ~/.bashrc "https://raw.githubusercontent.com/${USERNAME}/${REPONAME}/refs/heads/main/.bashrc" || mv ~/.bashrc.bak ~/.bashrc

echo "hello getting bash_aliases";
if [[ -f ~/.bash_aliases ]]; then
  mv ~/.bash_aliases ~/.bash_aliases.bak;
fi
wget -qO ~/.bash_aliases "https://raw.githubusercontent.com/${USERNAME}/${REPONAME}/refs/heads/main/.bash_aliases" || mv ~/.bash_aliases.bak ~/.bash_aliases

git config --global user.email "$USEREMAIL";
git config --global user.name "$NAME";
git config --global credential.helper 'cache --timeout=7200';



echo "and downloading your repos";
for r in "${REPOS[@]}"; do
	if [ ! -d "$HOME/$r" ]; then
		git clone "https://github.com/$USERNAME/$r.git" "$HOME/$r";
	fi
done;

rmdf()
{
		DF=("empty_directory" "my_school" "not_here" "old_school" "ready_to_be_removed" "school");
		echo "Would you like to remove the default folders and files from the holberton sandbox?";
		echo "${DF[*]}";
		read -p $'y/n: ' -r remove;
		if [[ "$remove" == "y" ]];then
			echo "removing defaults!";
			for d in "${DF[@]}"; do
				if [[ -d "$HOME/$d" || -f "$HOME/$d" ]]; then
					rm -r "$HOME/$d";
				fi;
			done		
		else
			echo "righty-o, not removing";
		fi
}

rmdf
source ~/.bashrc
