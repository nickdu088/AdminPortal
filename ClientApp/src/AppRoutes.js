import ApiAuthorzationRoutes from './components/api-authorization/ApiAuthorizationRoutes';
import { Counter } from "./components/Counter";
import { FetchData } from "./components/FetchData";
import Home from "./components/Home/Home";

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
  },
  ...ApiAuthorzationRoutes
];

export default AppRoutes;
