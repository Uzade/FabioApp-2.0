# FabioApp API

This is the backend of the FabioApp.
We use a SQLite database and connect it to the frontend via a rest api build with express.
For easy Requests and db structure we utilize Prisma3.

### Database structure

see db structure at [drawsql.app](https://drawsql.app/klausismausis/diagrams/main) or inspect the `prisma/schema.prisma` file.

### Documentation of API

ATM there is no documentation, but you con see all avalible requests in the ``.rest`` files located in ``./requests``


### Preparing to run the API

In order to run the api you have to first install all importand dependancies.

For this to work you need to have [node.js](https://nodejs.org/en/) installed. Check this with the command `node --version` and `npm --version`. If one of these throw an error, you need to reinstall node.js. Just download it from their website.

Now you can install the dependancies with the command `npm install`. Make shure you are in the working directory `.../FabioApp-2.0/backend`.

To use the database you have to construct the prisma client with the command `npx prisma generate`.

Now you can eigther inspect the database with `npx prisma studio`, or run the actual API with `npm run dev`.


### Test the API

while you can perform the simple get requests with you browser you may need a tool for running the other requests.

If you don't use VSCode you could download [Insomnia](https://insomnia.rest/) but if you have VSCode we suggest the plugin [REST Client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client).
With this you can directly run the requests in the `.rest` files.
