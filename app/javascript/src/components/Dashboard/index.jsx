import React, { useState, useEffect } from "react";
import { isNil, isEmpty, either } from "ramda";
import Container from "components/Container";
import ListUrls from "components/Urls/ListUrls";
import PageLoader from "components/PageLoader";
import urlsApi from "apis/urls";
import CreateUrl from "../Urls/CreateUrl";

const Dashboard = ({ history }) => {
  const [urls, setUrls] = useState([]);
  const [url, setUrl] = useState("");
  const [loading, setLoading] = useState(true);

  const fetchUrls = async () => {
    try {
      const response = await urlsApi.list();
      console.log("Response", response);
      setUrls(response.data.urls);
      setUrl("");
      setLoading(false);
    } catch (error) {
      logger.error(error);
      setLoading(false);
    }
  };

  const handleSubmit = async event => {
    event.preventDefault();
    try {
      await urlsApi.create({ url: { url } });
      fetchUrls();
      setLoading(false);
      // history.push("/dashboard");
    } catch (error) {
      logger.error(error);
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchUrls();
  }, []);

  if (loading) {
    return (
      <div className="w-screen h-screen">
        <PageLoader />
      </div>
    );
  }

  if (!either(isNil, isEmpty)(urls)) {
    return (
      <Container>
        <CreateUrl 
          url={url}
          setUrl={setUrl}
          loading={loading}
          handleSubmit={handleSubmit}
        />
        <ListUrls data={urls} />
      </Container>
    );
  }

  return (
    <Container>
      <h1 className="text-xl leading-5 text-center">
        You have not shortened any URLs 😔
      </h1>
    </Container>
  );
};

export default Dashboard;