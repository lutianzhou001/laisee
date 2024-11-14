import { CompilerConfig } from '@ton/blueprint';

export const compile: CompilerConfig = {
    lang: 'tact',
    target: 'contracts/lai_see.tact',
    options: {
        debug: true,
    },
};
