import axios from "axios";

const list = () => axios.get("/urls");
const create = payload => axios.post("/urls/", payload);
const show = slug => axios.get(`/urls/${slug}`);

const urlsApi = {
  list,
  create,
  show,
};

export default urlsApi;