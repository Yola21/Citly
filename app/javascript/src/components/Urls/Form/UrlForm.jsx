import React from "react";
import Input from "components/Input";
import Button from "components/Button";

const UrlForm = ({
  url,
  setUrl,
  loading,
  handleSubmit,
}) => {
  return (
    <form className="flex items-center max-w-lg mx-auto" onSubmit={handleSubmit}>
      <Input
        placeholder="Enter url"
        value={url}
        onChange={e => setUrl(e.target.value)}
      />
      <Button
        type="submit"
        buttonText="Shorten URL!"
        loading={loading}
      />
    </form>
  );
};

export default UrlForm;