it("test", async function () {
  const factory = await ethers.deployContract("Create2Deployer");
  const fooArtifact = await artifacts.readArtifact("Foo");
  const saltHex = ethers.utils.solidityKeccak256(
    ["string"],
    ["salt message"]
  );

  await factory.deploy(0, saltHex, fooArtifact.bytecode);
  try {
    await factory.deploy(0, saltHex, fooArtifact.bytecode);
  } catch {}
});
