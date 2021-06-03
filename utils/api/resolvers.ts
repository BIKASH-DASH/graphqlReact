import {gql} from 'apollo-server-micro'
export const resolvers = {
    Query : {
        hello: (parent,args,context) =>"hii"
    }
}