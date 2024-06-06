build:
  cd kernel && make build GUEST=on

copy-image: build
  cp kernel/target/x86_64/release/nimbos.bin ../arceos/apps/hv/guest/nimbos/nimbos.bin

hv: copy-image
  cd ../arceos && make ARCH=x86_64 A=apps/hv HV=y LOG=info GUEST=nimbos run 