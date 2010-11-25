<!--                                                                      ___           ___        -->
<!--                                           ___           ___         /\_ \         /\_ \ (R)   -->
<!--  sssssssssssssamuelolololololololol      /\_ \         /\_ \     ___\//\ \     ___\//\ \      -->
<!--    ____    __      ___ ___   __  __    __\//\ \     ___\//\ \   / __`\\ \ \   / __`\\ \ \     -->
<!--   /',__\ /'__`\  /' __` __`\/\ \/\ \ /'__`\\ \ \   / __`\\ \ \ /\ \L\ \\_\ \_/\ \L\ \\_\ \_   -->
<!--  /\__, `\\ \L\.\_/\ \/\ \/\ \ \ \_\ \\  __/ \_\ \_/\ \L\ \\_\ \\ \____//\____\ \____//\____\  -->
<!--  \/\____/ \__/.\_\ \_\ \_\ \_\ \____/ \____\/\____\ \____//\____\/___/ \/____/\/___/ \/____/  -->
<!--   \/___/ \/__/\/_/\/_/\/_/\/_/\/___/ \/____/\/____/\/___/ \/____/ by samuelololol@gmail.com   -->
 

gentoo-samuel overlay:                                       
======================
- dev-python/pydb:
  ---------------
    Add an USE='-emacs' flag in pydb-1.26.ebuild of Gentoo Official Overlay

- net-misc/gyazolinux/gyazolinux-9999:
  ------------------------------------
    This is Linux version of Gyazo written in C by tatofoo stored on github.

    Original Website: http://gyazo.com/en
    Porting Author:   Eduardo Grajeda <tatofoo@gmail.com>
    Project Page:     http://github.com/tatofoo/gyazo-linux
    
- net-misc/nicovideo-dl-0.0.20091209
  ----------------------------------
    Download nicodoga video in console by a python script

    Project Page: http://sourceforge.jp/projects/nicovideo-dl/

- net-misc/pcmanx-gtk2/pcmanx-gtk2-0.3.9-r1:
  ------------------------------------------
    Add 2 USE flag, mls & gcin
   
    * mls: MLS (Multi-Language Support) for PCManX
    * gcin: enable a patch for PCManX-gtk2(MLS), to disalbe the Simple Mode of PCManX
            which is in conflict with add-word function by GCIN.

    related pages:
    MLS:
    http://forums.gentoo.tw/viewtopic.php?f=20&t=44817&p=58775#p58775
    http://mstar.pixnet.net/blog/post/22473583
    Conflict fix:
    http://groups.google.com.bz/group/pcmanx/browse_thread/thread/4fd267cb92199d5a/-?hl=zh-TW

- media-sound/musescore/musescore-0.9.6.2.ebuild:
  -----------------------------------------------
    MuseScore is a free cross-platform WYSIWYG music notation program, that offers a 
    cost-effective alternative to professional programs such as Sibelius and Finale.
    You can print beautifully engraved sheet music or save it as PDF or MIDI file.

    Original Website: http://musescore.org/
    Ebuilds written by: keenblade http://bugs.gentoo.org/show_bug.cgi?id=296023#c15
                



<!-- {{{ -->
===========================================    
- vim-7.2:(*not working right now):
  ---------------------------------
    Add USE flag, gdb

    * gdb: vim with vimgdb support


    related pages:
    http://samuelololol.blogspot.com/2009/10/vimgdb-ebuilds-for-gentoo.html
    http://bugs.gentoo.org/show_bug.cgi?id=142593
<!-- }}} vim:fdm=marker -->

