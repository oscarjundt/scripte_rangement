hello(){
	ls *.$1 2>/dev/null;
}
hello3(){
	ls dossier_$1 2>/dev/null;
}
hello4(){
	ls $1.$2 2>/dev/null;
}
read -p 'donner extension a deplacer: ' a
c=$(hello $a)
c2=$(hello3 $a)
if [ "$a" == "" ] ; then
	echo fini
elif [ "$a" == "rien" ] ; then
	echo fini
else
	echo "1: $c"
	echo "2: $c2"
	read -p "voyer vous un dossier identique: " rose
	if [ "$rose" == "non" ] ; then
		if [ "$c2" == "" ] ; then
			mkdir dossier_$a
			if [ "$c" == "" ] ; then
				echo pas de fichier avec cette extension
			else
				mv *.$a dossier_$a
			fi
		else
			if [ "$c" == "" ] ; then
				echo pas de fichier avec cette extension
			else
				mv *.$a dossier_$a
			fi
		fi
	else
		read -p "le quel: " flora
		ant=$(hello4 $flora $a)
		nano $ant
		echo $ant
		read -p "voulez vous le supp: " supr
		if [ "$supr" == "oui" ] ; then
			rm $ant
		else
			read -p "donner nom pour le fichier: " ren
			mv $ant $ren.$a
			mv *.$a dossier_$a
		fi
	fi
fi
