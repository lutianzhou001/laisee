import { toNano } from '@ton/core';
import { LaiSee } from '../wrappers/LaiSee';
import { NetworkProvider } from '@ton/blueprint';

export async function run(provider: NetworkProvider) {
    const laiSee = provider.open(await LaiSee.fromInit(BigInt(Math.floor(Math.random() * 10000))));

    await laiSee.send(
        provider.sender(),
        {
            value: toNano('0.05'),
        },
        {
            $$type: 'Deploy',
            queryId: 0n,
        }
    );

    await provider.waitForDeploy(laiSee.address);

    console.log('ID', await laiSee.getId());
}
