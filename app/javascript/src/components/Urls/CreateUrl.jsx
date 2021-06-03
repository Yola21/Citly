import React, { useState } from "react";
// import Container from "components/Container";
import UrlForm from "components/Urls/Form/UrlForm";
// import urlsApi from "apis/urls";

const CreateUrl = ({ url, setUrl, loading, handleSubmit }) => {
//   const [url, setUrl] = useState("");
//   const [loading, setLoading] = useState(false);

  //   const handleSubmit = async event => {
  //     event.preventDefault();
  //     try {
  //       await urlsApi.create({ url: { url } });
  //       setLoading(false);
  //       history.push("/dashboard");
  //     } catch (error) {
  //       logger.error(error);
  //       setLoading(false);
  //     }
  //   };

  return (
    // <Container>
    <UrlForm
      url={url}
      setUrl={setUrl}
      loading={loading}
      handleSubmit={handleSubmit}
    />
    // </Container>
  );
};

export default CreateUrl;