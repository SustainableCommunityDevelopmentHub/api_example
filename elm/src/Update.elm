module Update exposing (..)

import Model exposing (..)
import User exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            model ! []

        EditUser id ->
            { model
                | formAction = Edit
                , selectedUser = Just id
            }
                ! []

        DeleteUser id ->
            { model
                | formAction = Delete
                , selectedUser = Just id
            }
                ! []

        NewUser ->
            { model
                | formAction = Create
                , selectedUser = Nothing
            }
                ! []

        ProcessUserGet (Ok users) ->
            { model
                | users = users
                , errors = Nothing
            }
                ! []

        ProcessUserGet (Err error) ->
            { model
                | errors = Just error
            }
                ! []
