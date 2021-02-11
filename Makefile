SRCS= icons/about.svg				\
	  icons/configure.svg			\
	  icons/datetime.svg			\
	  icons/ebook.svg				\
	  icons/explorer.svg			\
	  icons/generic.svg				\
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

OBJS := $(foreach res,$(RESOLUTIONS),$(foreach each,$(basename $(SRCS) .svg),pngs/$(res)/$(each).png))

.PHONY: all clean

all: $(OBJS)

clean:
	rm -rf pngs

pngs/320x240/imgs/selection.png: SIZE=-w 76 -h 50
pngs/320x240/imgs/section-l.png pngs/320x240/imgs/section-r.png: SIZE=-w 50 -h 46
pngs/320x240/imgs/%.png: SIZE=-w 16 -h 16
pngs/320x240/%.png: SIZE=-w 32 -h 32
pngs/640x480/imgs/selection.png: SIZE=-w 152 -h 100
pngs/640x480/imgs/%.png: SIZE=-w 32 -h 32
pngs/640x480/%.png: SIZE=-w 64 -h 64
pngs/640x480/imgs/section-l.png pngs/640x480/imgs/section-r.png: SIZE=-w 100 -h 92

pngs/320x240/%.png: %.svg
	@mkdir -p $(@D)
	inkscape --export-type=png $(SIZE) $< -o $@ 2>/dev/null

pngs/640x480/%.png: %.svg
	@mkdir -p $(@D)
	inkscape --export-type=png $(SIZE) $< -o $@ 2>/dev/null
