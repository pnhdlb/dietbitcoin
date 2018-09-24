#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

DIETBITCOIND=${DIETBITCOIND:-$SRCDIR/dietbitcoind}
DIETBITCOINCLI=${DIETBITCOINCLI:-$SRCDIR/dietbitcoin-cli}
DIETBITCOINTX=${DIETBITCOINTX:-$SRCDIR/dietbitcoin-tx}
DIETBITCOINQT=${DIETBITCOINQT:-$SRCDIR/qt/dietbitcoin-qt}

[ ! -x $DIETBITCOIND ] && echo "$DIETBITCOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
DDXVER=($($DIETBITCOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for dietbitcoind if --version-string is not set,
# but has different outcomes for dietbitcoin-qt and dietbitcoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$DIETBITCOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $DIETBITCOIND $DIETBITCOINCLI $DIETBITCOINTX $DIETBITCOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${DDXVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${DDXVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
