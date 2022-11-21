import ApiAuthorzationRoutes from './Components/api-authorization/ApiAuthorizationRoutes';
import { Counter } from "./Components/Counter";
import { FetchData } from "./Components/FetchData";
import Home from "./Components/Home/Home";
import Lists from './Pages/UserLists/UserLists';

const AppRoutes = [
  {
    index: true,
    path: '/',
    requireAuth: true,
    element: <Home />
  },
  {
    path: '/counter',
    element: <Counter />
  },
  {
    path: '/fetch-data',
    requireAuth: true,
    element: <FetchData />
  },
  {
    path: '/users',
      requireAuth: true,
      element: <Lists type="user" />
  },
  ...ApiAuthorzationRoutes
];

export default AppRoutes;
