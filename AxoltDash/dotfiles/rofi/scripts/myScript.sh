#!/bin/bash
options=(
    "ChatGPT"
    "WhatsApp"
    "Translate"
    "Google Classroom"
    "FCiencias"
    "Ingleishon"
    "DeepSeek"
    "Gemini"
	"Lumo"
    "Gmail"
    "GitHub"
    "Copilot"
    "Notion"
    "One Note"
    "YouTube"
    "YouTube Music"
    "YouTube Music Brave"
    "Lo-Fi Chill"
    "Pomodoro"
    "NixOS Packages"
	"Home manager NixOS"
    "Rust"
    "Rust - English"
    "Minecraft Bedrock"
    "Godot OpenGL3"
	"Zoom"
	"Gitmoji"
	"CSES"
	"Vjudge"
)

choice=$(printf "%s\n" "${options[@]}" | rofi -dmenu -i -p "Web:")

case "$choice" in
    "ChatGPT")
        nohup xdg-open https://chatgpt.com >/dev/null 2>&1 &
        ;;
    "WhatsApp")
        nohup xdg-open https://web.whatsapp.com/ >/dev/null 2>&1 &
        ;;
    "Translate")
        nohup xdg-open https://translate.google.com/?sl=en&tl=es&op=translate >/dev/null 2>&1 &
        ;;
    "Google Classroom")
        nohup xdg-open https://classroom.google.com/ >/dev/null 2>&1 &
        ;;
    "FCiencias")
        nohup xdg-open https://web.fciencias.unam.mx/acceder >/dev/null 2>&1 &
        ;;
    "Ingleishon")
        nohup xdg-open https://ingles.fciencias.unam.mx/cursos/login/index.php >/dev/null 2>&1 &
        ;;
    "DeepSeek")
        nohup xdg-open https://chat.deepseek.com/ >/dev/null 2>&1 &
        ;;
    "Gemini")
        nohup xdg-open https://gemini.google.com/u/1/app >/dev/null 2>&1 &
        ;;
	"Lumo")
		nohup xdg-open https://lumo.proton.me/ >/dev/null 2>&1 &
		;;
    "Gmail")
        nohup xdg-open https://mail.google.com/mail/u/0/#inbox >/dev/null 2>&1 &
        ;;
    "GitHub")
        nohup xdg-open https://github.com/ >/dev/null 2>&1 &
        ;;
    "Copilot")
        nohup xdg-open https://github.com/copilot >/dev/null 2>&1 &
        ;;
    "Notion")
        nohup xdg-open https://www.notion.so/0b6ccb529f65420fa75ed7f178ba8694 >/dev/null 2>&1 &
        ;;
    "One Note")
        nohup xdg-open https://onedrive.live.com/edit.aspx?resid=9FC9AB24401C708E!s02340cb7a941458cae36d9b2d093b1e3&migratedtospo=true&wd=target%28Quick%20Notes.one%7Cfea7eefe-78bf-ca45-9570-3241ad252b7f%2FWELCOME%20TO%20MY%20ONE%20NOTES%7C0669310a-da02-494a-b691-9b69aa9237c4%2F%29&wdorigin=NavigationUrl >/dev/null 2>&1 &
        ;;
    "YouTube")
        nohup xdg-open https://www.youtube.com/ >/dev/null 2>&1 &
        ;;
    "YouTube Music")
        nohup xdg-open https://music.youtube.com/ >/dev/null 2>&1 &
        ;;
    "YouTube Music Brave")
        nohup brave https://music.youtube.com/ >/dev/null 2>&1 &
        ;;
    "Lo-Fi Chill")
        nohup xdg-open https://www.youtube.com/watch?v=jfKfPfyJRdk >/dev/null 2>&1 &
        ;;
    "Pomodoro")
        nohup xdg-open https://www.youtube.com/watch?v=J2i0cZWCdq4 >/dev/null 2>&1 &
        ;;
    "NixOS Packages")
        nohup xdg-open https://search.nixos.org/packages >/dev/null 2>&1 &
        ;;
	"Home manager NixOS")
		nohup xdg-open https://home-manager.dev/manual/24.11/options.xhtml >/dev/null 2>&1 &
		;;
    "Rust")
        nohup xdg-open https://book.rustlang-es.org/ >/dev/null 2>&1 &
        ;;
    "Rust - English")
        nohup xdg-open https://doc.rust-lang.org/book/ >/dev/null 2>&1 &
        ;;
    "Minecraft Bedrock")
        nohup flatpak run io.mrarm.mcpelauncher >/dev/null 2>&1 &
        ;;
    "Godot OpenGL3")
        GDK_BACKEND=x11 godot --rendering-driver opengl3 >/dev/null 2>&1 &
        ;;
	"Zoom")
		nohup xdg-open https://us06web.zoom.us/j/87565078053?pwd=dGwzhbY5AGOZxl29mTyz5J0t3CwNub.1 >/dev/null 2>&1 &
		;;
	"Gitmoji")
		nohup xdg-open https://gitmoji.dev/ >/dev/null 2>&1 &
		;;
	"CSES")
		nohup xdg-open https://cses.fi/problemset/ >/dev/null 2>&1 &
		;;
	"Vjudge")
		nohup xdg-open https://vjudge.net/group/algoritmos1 >/dev/null 2>&1 &
		;;
    *)
        exit 1
        ;;
esac
