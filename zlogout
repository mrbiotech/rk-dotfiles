#
# Executes commands at logout.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Execute code only if STDERR is bound to a TTY.
[[ -o INTERACTIVE && -t 2 ]] && {

    SAYINGS=(
        "So long and thanks for all the fish.\n  -- Douglas Adams"
        "Good morning! And in case I don't see ya, good afternoon, good evening and goodnight.\n  --Truman Burbank"
        "See ya, sucka!"
        "Be well, do good work, and keep in touch.\n  --Garrison Keillor"
        "If you are brave enough to say goodby, life will reward you with a new hello.\n  --Paulo Coelho"
        "The world is round, and the place which may seem like the end may also be the beginning.\n  -- Ivy Baker Priest"
        "It takes a minute to say hello and forever to say goodbye.\n  --Unknown"
    )

  ### Print a randomly-chosen message:
  # echo $SAYINGS[$(($RANDOM % ${#SAYINGS} + 1))]

  # Print a random, hopefully interesting, adage.
  if (( $+commands[fortune] )); then
    echo $SAYINGS[$(($RANDOM % ${#SAYINGS} + 1))] | cowsay -w | lolcat -p 2
    print
  fi

} >&2
