import Model, { ObjectId } from "./model.class";
import ARea from "./area.class";
import OAuthProvider from "../model/oAuthProvider.enum";

export default class User extends Model {
    username: string;
    password?: string;
    oauthLoginProvider: OAuthProvider = OAuthProvider.LOCAL;
    oauthLoginProviderId?: string;
    token?: string;
    areas?: Array<ARea> | Array<ObjectId> = [];
    oauth?: {
        twitter?: {
            accessToken: string
            secretToken: string
        },
        github?: {
            accessToken: string
            refreshToken: string
        },
        discord?: {
            accessToken: string
            refreshToken: string
        }
        dropbox?: {
            accessToken: string
            refreshToken: string
        },
        notion?: {
            accessToken: string
        },
        twitch?: {
            accessToken: string
            refreshToken: string
        },
        linkedin?: {
            accessToken: string
            refreshToken: string
        },
        unsplash?: {
            accessToken: string
            refreshToken: string
        }
    };

    constructor(user: User) {
        super(user);

        this.username = user.username || "";
        this.password = user.password;
        if (user.oauthLoginProvider)
            this.oauthLoginProvider = user.oauthLoginProvider;
        this.oauthLoginProviderId = user.oauthLoginProviderId;
        this.token = user.token;
        this.oauth = {};
        if (user.oauth?.twitter)
            this.oauth.twitter = {
                accessToken: user.oauth.twitter.accessToken,
                secretToken: user.oauth.twitter.secretToken
            };
        if (user.oauth?.github)
            this.oauth.github = {
                accessToken: user.oauth.github.accessToken,
                refreshToken: user.oauth.github.refreshToken
            };
        if (user.oauth?.discord)
            this.oauth.discord = {
                accessToken: user.oauth.discord.accessToken,
                refreshToken: user.oauth.discord.refreshToken
            };
        if (user.oauth?.dropbox)
            this.oauth.dropbox = {
                accessToken: user.oauth.dropbox.accessToken,
                refreshToken: user.oauth.dropbox.refreshToken
            };
        if (user.oauth?.notion)
            this.oauth.notion = {
                accessToken: user.oauth.notion.accessToken
            };
        if (user.oauth?.twitch)
            this.oauth.twitch = {
                accessToken: user.oauth.twitch.accessToken,
                refreshToken: user.oauth.twitch.refreshToken
            };
        if (user.oauth?.linkedin)
            this.oauth.linkedin = {
                accessToken: user.oauth.linkedin.accessToken,
                refreshToken: user.oauth.linkedin.refreshToken
            };
        if (user.oauth?.unsplash)
            this.oauth.unsplash = {
                accessToken: user.oauth.unsplash.accessToken,
                refreshToken: user.oauth.unsplash.refreshToken
            };

        if (user.areas && Array.isArray(user.areas) && user.areas.length > 0)
            if ((user.areas[0] as ARea)._id)
                this.areas = (user.areas as Array<ARea>).map((area) => new ARea(area));
            else
                this.areas = user.areas;
    }
}