<img align="right" width="150" height="150" top="100" src="./assets/blueprint.png">

# huff-project-template • [![ci](https://github.com/huff-language/huff-project-template/actions/workflows/ci.yaml/badge.svg)](https://github.com/huff-language/huff-project-template/actions/workflows/ci.yaml) ![license](https://img.shields.io/github/license/huff-language/huff-project-template.svg) ![solidity](https://img.shields.io/badge/solidity-^0.8.15-lightgrey)

Versatile Huff Project Template using Foundry.

## Huff Console, VS Code Extentions, Debugger and Playground

- Use [Huff Console](https://github.com/AmadiMichael/Huff-Console)
- Use [Huff VS Code Extention](https://marketplace.visualstudio.com/items?itemName=huff-language.huff-language)
- Use [HEVM](https://github.com/ethereum/hevm) to use with the with the Huff debugger as required 
- Use [HEVM Dev](https://hevm.dev/getting-started.html) to learn more about HEVM useage
- Use [Huff Playground](https://oguimbal.github.io/huff/)
- Use [Huff HorseStore](https://www.youtube.com/watch?v=Yn58Jmkf2ow)

## HEVM

### Installation

Easiest way to install is download the binary from the latest release, convert to executable and move to `/usr/local/bin/` folder:

- Download release 0.53.0 binary [here](https://github.com/ethereum/hevm/releases/tag/release%2F0.53.0)
- Rename file to `hevm` using `mv hevm-x86_64-macos hevm`
- Add executable permisson using `chmod +x hevm`
- Move to `/usr/local/bin/` using `mv hevm /usr/local/bin/`
- Confirm install by starting new terminal and running `hevm version`

### Compile Huff and run in HEVM

- Compile `Example.huff` using `huffc src/example.huff --bin-runtime` to get the runtime bytecode
- Run the bytecode in `hevm` like so:

```
hevm exec --code 0x600435602435015f5260205ff3                   \
        --address 0546efe03e2501b38669f6f0cee94450a03686be8a    \
        --caller 0x00000000000000000000000000000000000000420    \
        --gas 0xffffffff                                        \
        --debug                                                 \
        --calldata 0x771602f700000000000000000000000000000000000000000000000000000000000000050000000000000000000000000000000000000000000000000000000000000006
```

In the above `hevm exec` example

- `--code` is the compiled runtime bytecode from compiling `Example.huff` using `huffc`.
- `--calldata` is the function signature of `add(uint256,uint256)` which is `0x771602f7` followed by the two abi encoded uint256 values which are 5 & 6. The calldata was generated using `cast cd "function add(uint256,uint256)" 0x5 0x6`.
- The other parameters should be self explanatory.

After running the above `hevm` command the output should be as follows which is `0x0b` in hex (11 in decimal).

```
 "Return: 0x000000000000000000000000000000000000000000000000000000000000000b"
```

## HUFF Template 

### Requirements

The following will need to be installed in order to use this template. Please follow the links and instructions.

-   [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)  
    -   You'll know you've done it right if you can run `git --version`
-   [Foundry / Foundryup](https://github.com/gakonst/foundry)
    -   This will install `forge`, `cast`, and `anvil`
    -   You can test you've installed them right by running `forge --version` and get an output like: `forge 0.2.0 (92f8951 2022-08-06T00:09:32.96582Z)`
    -   To get the latest of each, just run `foundryup`
-   [Huff Compiler](https://docs.huff.sh/get-started/installing/)
    -   You'll know you've done it right if you can run `huffc --version` and get an output like: `huffc 0.3.0`

### Quickstart

1. Clone this repo or use template

Click "Use this template" on [GitHub](https://github.com/huff-language/huff-project-template) to create a new repository with this repo as the initial state.

Or run:

```
git clone https://github.com/huff-language/huff-project-template
cd huff-project-template
```

2. Install dependencies

Once you've cloned and entered into your repository, you need to install the necessary dependencies. In order to do so, simply run:

```shell
forge install
```

3. Build & Test

To build and test your contracts, you can run:

```shell
forge build
forge test
```

For more information on how to use Foundry, check out the [Foundry Github Repository](https://github.com/foundry-rs/foundry/tree/master/forge) and the [foundry-huff library repository](https://github.com/huff-language/foundry-huff).


## Blueprint

```ml
lib
├─ forge-std — https://github.com/foundry-rs/forge-std
├─ foundry-huff — https://github.com/huff-language/foundry-huff
scripts
├─ Deploy.s.sol — Deployment Script
src
├─ SimpleStore — A Simple Storage Contract in Huff
test
└─ SimpleStore.t — SimpleStoreTests
```


## License

[The Unlicense](https://github.com/huff-language/huff-project-template/blob/master/LICENSE)


## Acknowledgements

- [forge-template](https://github.com/foundry-rs/forge-template)
- [femplate](https://github.com/abigger87/femplate)


## Disclaimer

_These smart contracts are being provided as is. No guarantee, representation or warranty is being made, express or implied, as to the safety or correctness of the user interface or the smart contracts. They have not been audited and as such there can be no assurance they will work as intended, and users may experience delays, failures, errors, omissions, loss of transmitted information or loss of funds. The creators are not liable for any of the foregoing. Users should proceed with caution and use at their own risk._