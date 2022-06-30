/* See LICENSE file for copyright and license details. */

/* interval between updates (in ms) */
const unsigned int interval = 1000;

/* text to show if no value can be retrieved */
static const char unknown_str[] = "na";

/* maximum output string length */
#define MAXLEN 2048

/*
 * Zephyrus uses wlo1 for net, and BAT0.
 * Lenovo uses wlp2s0 for net and BAT1.
 */

static const struct arg args[] = {
	/* function           format                                    argument */
	//{ separator,          " \x01 1\x02 2\x03 3\x04 4\x05 5\x06 6\x07 7\x08 8\x09 9\x01 ",           NULL },
	{ hostname,           " \x08\x09%s\x08 ",                     NULL },
	{ wifi_essid,         "\x03\x02直\x06\x04 %s ",               "wlp2s0" },
	{ wifi_perc,          "%s%% ",                                  "wlp2s0" },
	{ ipv4,               "%s \x05\x01",                           "wlp2s0" },
	{ cpu_perc,           " \x03\x02\x06\x04 %s%% \x05\x01",    NULL },
	{ ram_perc,           " \x03\x02\x06\x04 %s%% \x05\x01 ",   NULL },
	{ battery_perc,       "\x03\x02\x06ິ\x04 %s%% ",              "BAT1" },
	{ battery_state,      "%s ",                                    "BAT1" },
	{ battery_remaining,  "%s \x05\x01",                           "BAT1" },
	{ datetime,           " \x08\x09 %s \x08\x02",                "%a %F w:%U %I:%M%p" },
};

/*
 * function            description                     argument (example)
 *
 * battery_perc        battery percentage              battery name (BAT0)
 *                                                     NULL on OpenBSD/FreeBSD
 * battery_state       battery charging state          battery name (BAT0)
 *                                                     NULL on OpenBSD/FreeBSD
 * battery_remaining   battery remaining HH:MM         battery name (BAT0)
 *                                                     NULL on OpenBSD/FreeBSD
 * cpu_perc            cpu usage in percent            NULL
 * cpu_freq            cpu frequency in MHz            NULL
 * datetime            date and time                   format string (%F %T)
 * disk_free           free disk space in GB           mountpoint path (/)
 * disk_perc           disk usage in percent           mountpoint path (/)
 * disk_total          total disk space in GB          mountpoint path (/")
 * disk_used           used disk space in GB           mountpoint path (/)
 * entropy             available entropy               NULL
 * gid                 GID of current user             NULL
 * hostname            hostname                        NULL
 * ipv4                IPv4 address                    interface name (eth0)
 * ipv6                IPv6 address                    interface name (eth0)
 * kernel_release      `uname -r`                      NULL
 * keyboard_indicators caps/num lock indicators        format string (c?n?)
 *                                                     see keyboard_indicators.c
 * keymap              layout (variant) of current     NULL
 *                     keymap
 * load_avg            load average                    NULL
 * netspeed_rx         receive network speed           interface name (wlan0)
 * netspeed_tx         transfer network speed          interface name (wlan0)
 * num_files           number of files in a directory  path
 *                                                     (/home/foo/Inbox/cur)
 * ram_free            free memory in GB               NULL
 * ram_perc            memory usage in percent         NULL
 * ram_total           total memory size in GB         NULL
 * ram_used            used memory in GB               NULL
 * run_command         custom shell command            command (echo foo)
 * separator           string to echo                  NULL
 * swap_free           free swap in GB                 NULL
 * swap_perc           swap usage in percent           NULL
 * swap_total          total swap size in GB           NULL
 * swap_used           used swap in GB                 NULL
 * temp                temperature in degree celsius   sensor file
 *                                                     (/sys/class/thermal/...)
 *                                                     NULL on OpenBSD
 *                                                     thermal zone on FreeBSD
 *                                                     (tz0, tz1, etc.)
 * uid                 UID of current user             NULL
 * uptime              system uptime                   NULL
 * username            username of current user        NULL
 * vol_perc            OSS/ALSA volume in percent      mixer file (/dev/mixer)
 *                                                     NULL on OpenBSD
 * wifi_perc           WiFi signal in percent          interface name (wlan0)
 * wifi_essid          WiFi ESSID                      interface name (wlan0)
 */
