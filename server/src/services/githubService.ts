import { env } from "process";
import { Octokit } from "octokit";

function launchOctokit(personnalAccessToken: string): Octokit {
    return new Octokit({ auth: personnalAccessToken });
    // token obtained from my github account
}

export async function isNewPullRequest(repo: string, owner: string): Promise<boolean> {

    const octokit = launchOctokit("<personnal access token here>");

    console.log(await octokit.rest.pulls.list({
        repo: repo,
        owner: owner,
        per_page: 10
    }));

    return false;
}

export async function isNewIssue(repo: string, owner: string): Promise<boolean> {

    const octokit = launchOctokit("<personnal access token here>");

    console.log(await octokit.rest.issues.listForRepo({
        repo: repo,
        owner: owner,
        per_page: 10
    }));

    return false;
}


export async function CreateIssue(
    repo: string,
    owner: string,
    title: string | number,
    body: string | undefined,
    assignee: string | null | undefined): Promise<boolean> {

<<<<<<< HEAD
<<<<<<< HEAD
    const octokit = launchOctokit("<personnal access token here>");
=======
    const octokit = launchOctokit(`<personnal access token here>`);
>>>>>>> feat(src/services/githubService.ts) NOT TESTED: function to create an issue
=======
    const octokit = launchOctokit("<personnal access token here>");
>>>>>>> 90b4e59b4cd33e0bc68685c7d33b6d9219d62239

    await octokit.rest.issues.create({
        repo: repo,
        owner: owner,
        title: title,
        body: body,
        assignee: assignee
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 90b4e59b4cd33e0bc68685c7d33b6d9219d62239
    });
    console.log();

    return false;
<<<<<<< HEAD
}
=======
    })
    console.log();

    return false;
}

>>>>>>> feat(src/services/githubService.ts) NOT TESTED: function to create an issue
=======
}
>>>>>>> 90b4e59b4cd33e0bc68685c7d33b6d9219d62239
