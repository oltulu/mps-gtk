#!/bin/sh
TEXTDOMAINDIR=/usr/share/locale
TEXTDOMAIN=mps-gtk
img=/usr/share/icons/mps-gtk.png

XTERM="xterm"
#which lxterminal && XTERM="lxterminal"
WAIT="echo $(gettext 'Pencereyi kapatmak için enter tuşuna basınız'); read"

export TEXTDOMAINDIR=/usr/share/locale
export TEXTDOMAIN=pacmind

fuction_belong () {
	text=`zenity --title="$(gettext 'Yeniden Kur')" --entry --text="$(gettext 'Programı Yeniden Kur:') 'mps -ikz'"`
	case $? in
		-1)
			echo ""
		;;
		0)
		;;
		1)
			exit 0
		;;
		5)
			echo ""
		;;
	esac
	echo $text | $XTERM -T "$(gettext 'Programı Yeniden Kur')" -e "mps -ikz $text; $WAIT"
}

fuction_clear () {
	zenity --question --title="$(gettext 'Kaynak Temizle')" --text="$(gettext 'Kaynak Temizle'):
	'mps'" --ok-label="$(gettext 'Temizle')" --cancel-label="$(gettext 'Kapat')"
	case $? in
		-1)
			echo ""
		;;
		0)
			$XTERM -T "$(gettext 'Kaynak Temizle')" -e "mps; $WAIT"
		;;
		1)
			exit 0
		;;
		5)
			echo ""
		;;
	esac
}

fuction_db_upgrade () {
	$XTERM -T "MPS vt Güncelle" -e "sudo mps -G
	read -sp \"$(gettext 'Güncelleme Tamamlandı').
	$(gettext 'Pencereyi kapatmak için enter tuşuna basınız') \"
	"
}

fuction_dep () {
	zenity --question --title="$(gettext 'Gereksizleri Kaldır')" --text="$(gettext 'Gereksizleri Programları Kaldır'):
	'mps'" --ok-label="$(gettext 'Sil')" --cancel-label="$(gettext 'Kapat')"
	case $? in
		-1)
			echo ""
		;;
		0)
			xterm -bg black -fg white -T "$(gettext 'Gereksizleri Kaldır')" -e "mps; $WAIT"
		;;
		1)
			exit 0
		;;
		5)
			echo ""
		;;
	esac
}

fuction_force () {
	text=`zenity --title="$(gettext 'Gerekleriyle Kaldır')" --entry --text="$(gettext 'Gerekleriyle Kaldır'): 'mps -S'"`
	case $? in
		-1)
			echo ""
		;;
		0)
		;;
		1)
			exit 0
		;;
		5)
			echo ""
		;;
	esac
	echo $text | $XTERM -T "$(gettext 'Program Bilgisi')" -e "mps -S $text; $WAIT"
}

fuction_info_pkg () {
	text=`zenity --title="$(gettext 'Program  Hakkında Bilgi')" --entry --text="$(gettext 'Program Bul') : 'mps -b'"`
	case $? in
		-1)
			echo ""
		;;
		0)
		;;
		1)
			exit 0
		;;
		5)
			echo ""
		;;
	esac
	echo $text | $XTERM -T "$(gettext 'Program Bilgisi')" -e "mps -b $text; $WAIT"
}

fuction_info () {
	info_img=/usr/share/pixmaps/pacmind.png
	export MAIN_DIALOG='
	 <window title="'$(gettext 'Milis Program Ekle-Kaldır')'"  window_position="1">
	 <vbox>
	  <pixmap>
	      <input file>'$info_img'</input>
	    </pixmap>
	  <text use-markup="true">
	    <label>"<b>Milis Linux için pacmind uygulamasından yararlanılarak hazırlanmıştır.</b>"</label>
	  </text>
	  <text wrap="true" width-chars="50">
	    <label>'$(gettext 'Milis için GTK-Dialog ile hazırlanmış program kurma uygulamasıdır.')'</label>
	  </text>
	  <hbox>
	   <button ok></button>
	  </hbox>
	 </vbox>
	</window>
	'
	gtkdialog --program=MAIN_DIALOG
}


fuction_install () {
	if text=`zenity --title="$(gettext 'Program Kur')" --entry --text="$(gettext 'Bir yada daha fazla program kurun'): 'mps kur'
	$(gettext 'Birden fazla olması halinde, biri ile diğeri arasında boşluk bırakın')"`
	then echo $text
	$XTERM -T "$(gettext 'Program Kur')" -e "mps kur $text; $WAIT"
	fi
}

fuction_optimize () {
	$XTERM -T "Optimizes Pacman" -e "sudo pacman-optimize
	read -sp \"
	$(gettext 'Pencereyi kapatmak için enter tuşuna basınız') \"
	"
}

fuction_pacdiff () {
	$XTERM -T "Depo Klasörünü Temizle" -e "sudo rm -rf /depo/paketler/*; $WAIT"
}

fuction_remove () {
	if text=`zenity --title="$(gettext 'Program Sil')" --entry --text="$(gettext 'Bir yada daha fazla programı silin'): 'mps sil'
	$(gettext 'Birden fazla program kaldıracaksanız aralarında boşluk bırakın')"`
	then echo $text
	$XTERM -T "$(gettext 'Program Sil')" -e "mps sil $text; $WAIT"
	fi
}

fuction_find_install () {
	text=`zenity --title="$(gettext 'Programı Derle ve Kur')" --entry --text="$(gettext 'Programı derle ve kur'): 'mps odkp'"`
	case $? in
		-1)
			echo ""
		;;
		0)
		;;
		1)
			exit 0
		;;
		5)
			echo ""
		;;
	esac
	echo $text | $XTERM -T "$(gettext 'Programı derle ve kur')" -e "mps odkp $text; $WAIT"
}

fuction_find () {
	text=`zenity --title="$(gettext 'Program Bul')" --entry --text="$(gettext 'İsim veya açıklamaya göre program bul'): 'mps ara'
	$(gettext 'Örnek, pdf reader için pdf yazınız')" --entry-text="$(gettext 'buraya yazınız')"`
	case $? in
		-1)
			echo ""
		;;
		0)
		;;
		1)
			exit 0
		;;
		5)
			echo ""
		;;
	esac
	echo $text | $XTERM -T "$(gettext 'Program bul')" -e "mps ara $text; $WAIT"
}

fuction_update () {
	zenity --question --title="$(gettext 'Tüm Sistemi Güncelle')" --text="$(gettext 'Programları günceller'): 'mps -GS'" --ok-label="$(gettext 'Güncelle')" --cancel-label="$(gettext 'Kapat')"
	case $? in
		-1)
			echo ""
		;;
		0)
			$XTERM -T "$(gettext 'Sistemi Güncelle')" -e "mps -GS; $WAIT"
		;;
		1)
			exit 0
		;;
		5)
			echo ""
		;;
	esac
}

fuction_sync () {
	zenity --question --title="$(gettext 'Talimat Güncelle')" --text="$(gettext 'Talimatları günceller'): 'mps -GG'" --ok-label="$(gettext 'Güncelle')" --cancel-label="$(gettext 'Kapat')"
	case $? in
		-1)
			echo ""
		;;
		0)
			$XTERM -T "$(gettext 'Talimat Güncelle')" -e "mps -GG; $WAIT"
		;;
		1)
			exit 0
		;;
		5)
			echo ""
		;;
	esac
}

fuction_inman () {
	if text=`zenity --title="$(gettext 'Bilgisayardan Program Kur'): 'mps kur'" --file-selection`
	then echo $text
	$XTERM -T "$(gettext 'Bilgisayardan mps.lz uzantılı dosya kurun')" -e "mps kur \"$text\"; $WAIT"
	fi
}



case $1 in
	1)
		fuction_sync
	;;
	2)
		fuction_update
	;;
	3)
		fuction_force
	;;
	4)
		fuction_install
	;;
	5)
		fuction_remove
	;;
	6)
		fuction_find
	;;
	7)
		fuction_find_install
	;;
	8)
		fuction_belong
	;;
	9)
		fuction_info_pkg
	;;
	10)
		fuction_inman
	;;
	11)
		fuction_dep
	;;
	12)
		fuction_clear
	;;
	13)
		fuction_pacdiff
	;;
	14)
		fuction_db_upgrade
	;;
	15)
		fuction_optimize
	;;
	16)
		fuction_info
	;;
	17)
esac
