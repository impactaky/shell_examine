import $ from "https://deno.land/x/dax_extras/mod.ts";

async function rpath(path: PathRef) {
  const runPath = (await $`objdump -x ${path}`.stderr("null").noThrow()
    .apply((l) => {
      const e = $.split(l);
      if (e[0] != "RUNPATH") return;
      if (e[1].match(/\$ORIGIN/)) return;
      return e[1];
    })
    .text()).trimEnd();
  if (!runPath) return;
  console.log(runPath);
  const deployBin = `deploy/${path.basename()}`;
  await path.copyFile(deployBin);
  const newRunPath = runPath.replace(/^\//, "/host/").replace(":/", ":/host/");
  await $`/usr/bin/patchelf --set-rpath ${newRunPath} ${deployBin}`;
  await $.path("./target.log").appendText(
    `add /host prefix to RUNPATH in ${deployBin}\n`,
  );
}

await $.xargs($.path("./bin/").readDir(), (w) => rpath(w.path), $.nproc());
