# dstar-n800

Reverse engineered AMBE codec hacked up to run on Nokia N800 tablet.
The code was extracted from official Icom ID-51E firmware update package.

On the tablet:
 * copy `dstar.o` to `/lib/dsp/modules`
 * register codec in the `/lib/dsp/dsp_dld_avs.conf` adding the following line:

    `dstar           _dstar_dsptask          1       /lib/dsp/modules/dstar.o`

 * launch `ambeserver`

On the host:
 * point https://github.com/mcdermj/buster to ip address of the tablet, port 2460

Nokia 770 and N810 should be compatible too.
