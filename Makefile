SRCS= icons/about.svg				\
	  icons/configure.svg			\
	  icons/datetime.svg			\
	  icons/ebook.svg				\
	  icons/explorer.svg			\
	  icons/generic.svg				\
	  icons/gmu.svg				\
	  icons/network.svg				\
	  icons/passwd.svg				\
	  icons/poweroff.svg			\
	  icons/reboot.svg				\
	  icons/section.svg				\
	  icons/skin.svg				\
	  icons/system-info.svg			\
	  icons/usb.svg					\
	  icons/utilities-terminal.svg	\
	  icons/wallpaper.svg			\
	  imgs/cpu.svg					\
	  imgs/file.svg					\
	  imgs/folder.svg				\
	  imgs/manual.svg				\
	  imgs/sd.svg					\
	  imgs/section-l.svg			\
	  imgs/section-r.svg			\
	  imgs/selection.svg			\
	  imgs/battery/0.svg			\
	  imgs/battery/1.svg			\
	  imgs/battery/2.svg			\
	  imgs/battery/3.svg			\
	  imgs/battery/4.svg			\
	  imgs/battery/5.svg			\
	  imgs/battery/ac.svg			\
	  imgs/buttons/accept.svg		\
	  imgs/buttons/cancel.svg		\
	  imgs/buttons/down.svg			\
	  imgs/buttons/left.svg			\
	  imgs/buttons/right.svg		\
	  imgs/buttons/select.svg		\
	  imgs/buttons/start.svg		\
	  imgs/buttons/up.svg			\
	  sections/applications.svg		\
	  sections/emulators.svg		\
	  sections/games.svg			\
	  sections/settings.svg

RESOLUTIONS=320x240 640x480

OBJS := $(foreach res,$(RESOLUTIONS),$(foreach each,$(SRCS),pngs/$(res)/$(each:.svg=.png)))

.PHONY: all clean

all: $(OBJS)

clean:
	rm -rf pngs

pngs/320x240/%.png: %.svg
	@mkdir -p $(@D)
	inkscape --export-type=png --export-dpi=96 $< -o $@ 2>/dev/null

pngs/640x480/%.png: %.svg
	@mkdir -p $(@D)
	inkscape --export-type=png --export-dpi=192 $< -o $@ 2>/dev/null
